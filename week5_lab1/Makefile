CXX      = g++
CXXFLAGS = -std=c++20

LIB_NAME = merge_sort
SRC_DIR = source
LIB_SRCS = $(wildcard $(SRC_DIR)/*.cpp)
LIB_OBJS = $(notdir $(LIB_SRCS:.cpp=.o))
LIB_OJBS_PIC = $(notdir $(LIB_SRCS:.cpp=_pic.o))
LIB_STATIC = lib$(LIB_NAME).a
LIB_SHARED = lib$(LIB_NAME).so

TARGET    = merge_sort

all: $(TARGET)_static $(TARGET)_shared

main.o: $(SRC_DIR)/main.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# static
%.o: $(SRC_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(LIB_STATIC): $(LIB_OBJS)
	ar -rcs $(LIB_STATIC) $(LIB_OBJS)

$(TARGET)_static: main.o $(LIB_STATIC)
	$(CXX) $(CXXFLAGS) -o $@ main.o -L. -l$(LIB_NAME)

# shared
%_pic.o: $(SRC_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -fPIC -c $< -o $@

$(LIB_SHARED): $(LIB_OJBS_PIC)
	$(CXX) -shared -o $(LIB_SHARED) $(LIB_OJBS_PIC)

$(TARGET)_shared: main.o $(LIB_SHARED)
	$(CXX) $(CXXFLAGS) -o $@.elf main.o -L. -l$(LIB_NAME)

# cleanup
.PHONY: clean all 
clean:
	rm -f *.o $(LIB_STATIC) $(LIB_SHARED) $(TARGET)_static $(TARGET)_shared.elf