Return-Path: <linux-input+bounces-3475-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 266C48BC572
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 03:30:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA0761F2118F
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 01:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D040F3C485;
	Mon,  6 May 2024 01:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gr0H0xHT"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23AC381AA
	for <linux-input@vger.kernel.org>; Mon,  6 May 2024 01:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714959046; cv=none; b=tWSXsaRPkBuevq8oRpFb2DSve/owahMAMDmd9zqcjXzmPok36RxhyMVP5osTQvCmvHb4nGB0jO4EfGD/3j1R7xXlu6EKp2ibL8x5MyA5A93hxQ+DI7Yo1ymDc5ryt6je8Ma22ZZR8N4aogy9bXmKFhalS3/RMUc0BlFlR5ayoc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714959046; c=relaxed/simple;
	bh=GbPFKax1AUFm5v+Qmxx1wgB9gElrx2gO051/IbYxByM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KmzpcMDVBPULldEGKGbjqncofLVRzXjqC3cvDZLqKW9kDxpVJB1DLQVjP+Vz+7LiGlth+CC2M1iPkWGstsKIYekDenFWfxCBsYn6+esGwjZHnNFbZsrkveUJntMDkPxkJeMhYmr9Fzuy3KlvMXwWAx63w9TB7DdaU+E5kj2JHMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gr0H0xHT; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714959045; x=1746495045;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GbPFKax1AUFm5v+Qmxx1wgB9gElrx2gO051/IbYxByM=;
  b=Gr0H0xHTEbQBwkho+5k6IXqScfdOs7jYgoUEJOBaG8b4xZ/c+jVQR42Q
   Ci6dyr/Y1fLu6G1kbGA7s3TNiVUSfA5PZ33pDKwxKEfsjavMRColLx2Lc
   P2fxu5dZmWLk8LumibacTHc5JOzYVgJ9G5Tlm/bOsMt2IsgnNZkzuQux5
   L+wskxn9zXPeZG/ZYofDDdODixp8D91g1tGyRmkSXzTCNN2VtDKobBZFp
   lxb7tewC6OPXPmhAQWIxeHhi1c9N8KVMNgDOCyQKd6hvqucGqGd6w69Ku
   Phi98WuSj/Hh91b/WcCzrIIOxAA4V0URhGW1q2x7VZPXGAi95PfgL+Bld
   g==;
X-CSE-ConnectionGUID: fyaRlECVRJq04THT+GsjFg==
X-CSE-MsgGUID: rQsjLEmESBWG4PguvtEy2A==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="14503854"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="14503854"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 18:30:44 -0700
X-CSE-ConnectionGUID: lF7u3f9gSPOoKx9GiKFWfA==
X-CSE-MsgGUID: TLJzi5igQuy1RkJPBGkwvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="28092901"
Received: from unknown (HELO ipg-l-lixuzha.sh.intel.com) ([10.239.153.157])
  by fmviesa010.fm.intel.com with ESMTP; 05 May 2024 18:30:43 -0700
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com
Subject: [PATCH 1/5] Documentation: hid: intel-ish-hid: remove section numbering
Date: Mon,  6 May 2024 09:30:36 +0800
Message-Id: <20240506013040.10700-2-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240506013040.10700-1-lixu.zhang@intel.com>
References: <20240506013040.10700-1-lixu.zhang@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Qianru Huang <qianru.huang@intel.com>

Remove section numbering from the Intel Integrated Sensor Hub (ISH)
documentation to simplify the structure, making it easier to maintain
and update in the future.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Qianru Huang <qianru.huang@intel.com>
Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 Documentation/hid/intel-ish-hid.rst | 72 ++++++++++++++---------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/Documentation/hid/intel-ish-hid.rst b/Documentation/hid/intel-ish-hid.rst
index 42dc77b7b10f..12613cb2be43 100644
--- a/Documentation/hid/intel-ish-hid.rst
+++ b/Documentation/hid/intel-ish-hid.rst
@@ -18,8 +18,8 @@ These ISH also comply to HID sensor specification, but the difference is the
 transport protocol used for communication. The current external sensor hubs
 mainly use HID over I2C or USB. But ISH doesn't use either I2C or USB.
 
-1. Overview
-===========
+Overview
+========
 
 Using a analogy with a usbhid implementation, the ISH follows a similar model
 for a very high speed communication::
@@ -58,8 +58,8 @@ implemented as a bus. Each client application executing in the ISH processor
 is registered as a device on this bus. The driver, which binds each device
 (ISH HID driver) identifies the device type and registers with the HID core.
 
-2. ISH Implementation: Block Diagram
-====================================
+ISH Implementation: Block Diagram
+=================================
 
 ::
 
@@ -96,27 +96,27 @@ is registered as a device on this bus. The driver, which binds each device
 	| ISH Hardware/Firmware(FW) |
 	 ----------------------------
 
-3. High level processing in above blocks
-========================================
+High level processing in above blocks
+=====================================
 
-3.1 Hardware Interface
-----------------------
+Hardware Interface
+------------------
 
 The ISH is exposed as "Non-VGA unclassified PCI device" to the host. The PCI
 product and vendor IDs are changed from different generations of processors. So
 the source code which enumerates drivers needs to update from generation to
 generation.
 
-3.2 Inter Processor Communication (IPC) driver
-----------------------------------------------
+Inter Processor Communication (IPC) driver
+------------------------------------------
 
 Location: drivers/hid/intel-ish-hid/ipc
 
 The IPC message uses memory mapped I/O. The registers are defined in
 hw-ish-regs.h.
 
-3.2.1 IPC/FW message types
-^^^^^^^^^^^^^^^^^^^^^^^^^^
+IPC/FW message types
+^^^^^^^^^^^^^^^^^^^^
 
 There are two types of messages, one for management of link and another for
 messages to and from transport layers.
@@ -142,20 +142,20 @@ register has the following format::
   Bit 31: doorbell trigger (signal H/W interrupt to the other side)
   Other bits are reserved, should be 0.
 
-3.2.2 Transport layer interface
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+Transport layer interface
+^^^^^^^^^^^^^^^^^^^^^^^^^
 
 To abstract HW level IPC communication, a set of callbacks is registered.
 The transport layer uses them to send and receive messages.
 Refer to struct ishtp_hw_ops for callbacks.
 
-3.3 ISH Transport layer
------------------------
+ISH Transport layer
+-------------------
 
 Location: drivers/hid/intel-ish-hid/ishtp/
 
-3.3.1 A Generic Transport Layer
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+A Generic Transport Layer
+^^^^^^^^^^^^^^^^^^^^^^^^^
 
 The transport layer is a bi-directional protocol, which defines:
 - Set of commands to start, stop, connect, disconnect and flow control
@@ -166,8 +166,8 @@ This protocol resembles bus messages described in the following document:
 http://www.intel.com/content/dam/www/public/us/en/documents/technical-\
 specifications/dcmi-hi-1-0-spec.pdf "Chapter 7: Bus Message Layer"
 
-3.3.2 Connection and Flow Control Mechanism
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+Connection and Flow Control Mechanism
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 Each FW client and a protocol is identified by a UUID. In order to communicate
 to a FW client, a connection must be established using connect request and
@@ -181,8 +181,8 @@ before receiving the next flow control credit.
 Either side can send disconnect request bus message to end communication. Also
 the link will be dropped if major FW reset occurs.
 
-3.3.3 Peer to Peer data transfer
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+Peer to Peer data transfer
+^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 Peer to Peer data transfer can happen with or without using DMA. Depending on
 the sensor bandwidth requirement DMA can be enabled by using module parameter
@@ -217,8 +217,8 @@ In principle, multiple DMA_XFER and DMA_XFER_ACK messages may be sent at once
 Currently, ISH FW decides to send over DMA if ISHTP message is more than 3 IPC
 fragments and via IPC otherwise.
 
-3.3.4 Ring Buffers
-^^^^^^^^^^^^^^^^^^
+Ring Buffers
+^^^^^^^^^^^^
 
 When a client initiates a connection, a ring of RX and TX buffers is allocated.
 The size of ring can be specified by the client. HID client sets 16 and 32 for
@@ -228,8 +228,8 @@ bus message protocol. These buffers are required because the FW may have not
 have processed the last message and may not have enough flow control credits
 to send. Same thing holds true on receive side and flow control is required.
 
-3.3.5 Host Enumeration
-^^^^^^^^^^^^^^^^^^^^^^
+Host Enumeration
+^^^^^^^^^^^^^^^^
 
 The host enumeration bus command allows discovery of clients present in the FW.
 There can be multiple sensor clients and clients for calibration function.
@@ -252,8 +252,8 @@ Enumeration sequence of messages:
 - Once host received properties for that last discovered client, it considers
   ISHTP device fully functional (and allocates DMA buffers)
 
-3.4 HID over ISH Client
------------------------
+HID over ISH Client
+-------------------
 
 Location: drivers/hid/intel-ish-hid
 
@@ -265,16 +265,16 @@ The ISHTP client driver is responsible for:
 - Process Get/Set feature request
 - Get input reports
 
-3.5 HID Sensor Hub MFD and IIO sensor drivers
----------------------------------------------
+HID Sensor Hub MFD and IIO sensor drivers
+-----------------------------------------
 
 The functionality in these drivers is the same as an external sensor hub.
 Refer to
 Documentation/hid/hid-sensor.rst for HID sensor
 Documentation/ABI/testing/sysfs-bus-iio for IIO ABIs to user space.
 
-3.6 End to End HID transport Sequence Diagram
----------------------------------------------
+End to End HID transport Sequence Diagram
+-----------------------------------------
 
 ::
 
@@ -339,16 +339,16 @@ Documentation/ABI/testing/sysfs-bus-iio for IIO ABIs to user space.
           |                        |                       |                               |
 
 
-3.7 ISH Debugging
------------------
+ISH Debugging
+-------------
 
 To debug ISH, event tracing mechanism is used. To enable debug logs::
 
   echo 1 > /sys/kernel/tracing/events/intel_ish/enable
   cat /sys/kernel/tracing/trace
 
-3.8 ISH IIO sysfs Example on Lenovo thinkpad Yoga 260
------------------------------------------------------
+ISH IIO sysfs Example on Lenovo thinkpad Yoga 260
+-------------------------------------------------
 
 ::
 
-- 
2.34.1


