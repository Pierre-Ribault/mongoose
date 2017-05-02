
import os
import csv
import numpy as np
import matplotlib.pyplot as plt


def load_results(path):
    files = os.listdir(path)

    results = dict()

    for f in files: 
        with open(path + f) as csvfile:
            data = []
            reader = csv.reader(csvfile, delimiter=',')
            for row in reader:
                data.append(row)

            results[f] = data

    return results


def pack_results(results):
    """ Convert the results in a numpy array """
    result_list = []
    for key in results:
        print key
        test = results[key]
        features = []
        for feature in test:
            try: 
                features.append(float(feature[0]))
            except:
                features.append(-1.0)
        
        result_list.append(features)

    return np.array(result_list)


def extract_features(results, index):
    feature = []
    for key in results:
        recording = results[key]
        value = float(recording[index][0])
        # normalize by time
        value = value / float(recording[2][0])
        feature.append(value)

    name = results["blur.txt"][index][2]
    return np.array(feature), name


def bar_plot(matrix):
    fig, axarr = plt.subplots(5, 5)

    y_pos = np.arange(7)

    for x in range(5):
        for y in range(5):
            feature = x*5+y
            points = matrix[:, feature]

            axarr[x, y].bar(y_pos, points, align='center', alpha=0.5)

    plt.show()


def bar_plot_alt(results):
    fig, axarr = plt.subplots(5, 5)

    y_pos = np.arange(len(results.keys()))

    fr_index = 0
    pp_index = 0
    for index, key in enumerate(results.keys()):
        if key == "fr_attack.txt":
            fr_index = index
        elif key == "pp_attack.txt":
            pp_index = index

    print results.keys()

    for x in range(5):
        for y in range(5):
            points, name = extract_features(results, x*5+y)

            bars = axarr[x, y].bar(y_pos, points, align='center', alpha=0.5)

            bars[fr_index].set_color('g')
            bars[pp_index].set_color('r')
            axarr[x, y].set_title(name)
            if x == 4: 
                axarr[x, y].set_xticklabels(results.keys(), rotation=45)
            else:
                axarr[x, y].set_xticklabels([])

    plt.show()


def get_datapoints(data, index):
    datapoints = []
    for key, value in data.iteritems():
        try: 
            datapoints.append(float(value[index][0]))
        except:
            datapoints.append(-1.0)

    return datapoints

    
def main(path):

    plt.figure(1)


    results = load_results(path)

    programs = [key for key in results]
    y_pos = np.arange(len(programs))

    for feature in range(9):
        plt.subplot(540 + feature + 1)
        datapoints = get_datapoints(results, feature)
        print datapoints
        plt.bar(y_pos, datapoints, align='center', alpha=0.5)
        plt.xticks(y_pos, programs)
        plt.ylabel('instructions')
        plt.title("number of instructions for each of the benchmarks")

    plt.show()
