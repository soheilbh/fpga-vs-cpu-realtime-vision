CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -O3 -I..
LDFLAGS = -pthread

SRCS = play_sequence.cpp ../src/fpga_sw/detector.cpp ../src/fpga_sw/recognizer.cpp
OBJS = $(SRCS:.cpp=.o)
TARGET = play_sequence

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $@ $^

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

clean:
	rm -f $(OBJS) $(TARGET)

.PHONY: all clean 