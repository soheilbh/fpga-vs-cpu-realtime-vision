"""
Logging Module

This module handles logging and performance metrics collection.
It provides functionality for both development debugging and performance analysis.
"""

import logging
from settings.config import LOG_LEVEL, ENABLE_PERFORMANCE_LOGGING

def setup_logger(name: str) -> logging.Logger:
    """
    Set up a logger with the specified name.
    
    Args:
        name (str): Name of the logger
        
    Returns:
        logging.Logger: Configured logger instance
    """
    logger = logging.getLogger(name)
    logger.setLevel(LOG_LEVEL)
    
    # Create console handler
    ch = logging.StreamHandler()
    ch.setLevel(LOG_LEVEL)
    
    # Create formatter
    formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
    ch.setFormatter(formatter)
    
    # Add handler to logger
    logger.addHandler(ch)
    
    return logger

class PerformanceLogger:
    """
    Handles performance metrics logging.
    """
    
    def __init__(self):
        """Initialize the performance logger."""
        self.logger = setup_logger('performance')
        self.enabled = ENABLE_PERFORMANCE_LOGGING

    def log_metrics(self, metrics: dict):
        """
        Log performance metrics.
        
        Args:
            metrics (dict): Dictionary of performance metrics to log
        """
        if self.enabled:
            self.logger.info(f"Performance metrics: {metrics}")
