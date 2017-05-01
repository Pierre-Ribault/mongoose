
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


# def bar_plot(path):
    # results = load_results(path)

    # # for feature in range(21):
    # for key, value in results.iteritems():
        # feature = 0
        # data = value[feature][0]

    # y_pos = np.arange(len
    # plt.bar(


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
