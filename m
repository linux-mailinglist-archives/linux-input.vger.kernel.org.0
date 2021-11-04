Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47E17445405
	for <lists+linux-input@lfdr.de>; Thu,  4 Nov 2021 14:37:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231185AbhKDNj6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Nov 2021 09:39:58 -0400
Received: from mga12.intel.com ([192.55.52.136]:50270 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230401AbhKDNj6 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 4 Nov 2021 09:39:58 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="211755179"
X-IronPort-AV: E=Sophos;i="5.87,208,1631602800"; 
   d="scan'208";a="211755179"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2021 06:37:15 -0700
X-IronPort-AV: E=Sophos;i="5.87,208,1631602800"; 
   d="scan'208";a="501542007"
Received: from eyulyugi-mobl1.ger.corp.intel.com (HELO tkristo-desk.intel.com) ([10.251.215.15])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2021 06:37:13 -0700
From:   Tero Kristo <tero.kristo@linux.intel.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        mika.westerberg@linux.intel.com, tero.kristo@linux.intel.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC 1/8] HID: debug: Add USI usages
Date:   Thu,  4 Nov 2021 15:36:54 +0200
Message-Id: <20211104133701.1733551-2-tero.kristo@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211104133701.1733551-1-tero.kristo@linux.intel.com>
References: <20211104133701.1733551-1-tero.kristo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Mika Westerberg <mika.westerberg@linux.intel.com>

Add USI defined usages to the HID debug code.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
[tero.kristo: squashed in EV_MSC definitions]
Signed-off-by: Tero Kristo <tero.kristo@linux.intel.com>
---
 drivers/hid/hid-debug.c | 40 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
index fa57d05badf7..9d617f231591 100644
--- a/drivers/hid/hid-debug.c
+++ b/drivers/hid/hid-debug.c
@@ -141,8 +141,10 @@ static const struct hid_usage_entry hid_usage_table[] = {
     {0, 0x33, "Touch"},
     {0, 0x34, "UnTouch"},
     {0, 0x35, "Tap"},
+    {0, 0x38, "Transducer Index"},
     {0, 0x39, "TabletFunctionKey"},
     {0, 0x3a, "ProgramChangeKey"},
+    {0, 0x3B, "Battery Strength"},
     {0, 0x3c, "Invert"},
     {0, 0x42, "TipSwitch"},
     {0, 0x43, "SecondaryTipSwitch"},
@@ -160,6 +162,39 @@ static const struct hid_usage_entry hid_usage_table[] = {
     {0, 0x59, "ButtonType"},
     {0, 0x5A, "SecondaryBarrelSwitch"},
     {0, 0x5B, "TransducerSerialNumber"},
+    {0, 0x5C, "Preferred Color"},
+    {0, 0x5D, "Preferred Color is Locked"},
+    {0, 0x5E, "Preferred Line Width"},
+    {0, 0x5F, "Preferred Line Width is Locked"},
+    {0, 0x70, "Preferred Line Style"},
+      {0, 0x71, "Preferred Line Style is Locked"},
+      {0, 0x72, "Ink"},
+      {0, 0x73, "Pencil"},
+      {0, 0x74, "Highlighter"},
+      {0, 0x75, "Chisel Marker"},
+      {0, 0x76, "Brush"},
+      {0, 0x77, "No Preference"},
+    {0, 0x80, "Digitizer Diagnostic"},
+    {0, 0x81, "Digitizer Error"},
+      {0, 0x82, "Err Normal Status"},
+      {0, 0x83, "Err Transducers Exceeded"},
+      {0, 0x84, "Err Full Trans Features Unavailable"},
+      {0, 0x85, "Err Charge Low"},
+    {0, 0x90, "Transducer Software Info"},
+      {0, 0x91, "Transducer Vendor Id"},
+      {0, 0x92, "Transducer Product Id"},
+    {0, 0x93, "Device Supported Protocols"},
+    {0, 0x94, "Transducer Supported Protocols"},
+      {0, 0x95, "No Protocol"},
+      {0, 0x96, "Wacom AES Protocol"},
+      {0, 0x97, "USI Protocol"},
+      {0, 0x98, "Microsoft Pen Protocol"},
+    {0, 0xA0, "Supported Report Rates"},
+      {0, 0xA1, "Report Rate"},
+      {0, 0xA2, "Transducer Connected"},
+      {0, 0xA3, "Switch Disabled"},
+      {0, 0xA4, "Switch Unimplemented"},
+      {0, 0xA5, "Transducer Switches"},
   { 15, 0, "PhysicalInterfaceDevice" },
     {0, 0x00, "Undefined"},
     {0, 0x01, "Physical_Interface_Device"},
@@ -990,7 +1025,10 @@ static const char *absolutes[ABS_CNT] = {
 
 static const char *misc[MSC_MAX + 1] = {
 	[MSC_SERIAL] = "Serial",	[MSC_PULSELED] = "Pulseled",
-	[MSC_GESTURE] = "Gesture",	[MSC_RAW] = "RawData"
+	[MSC_GESTURE] = "Gesture",	[MSC_RAW] = "RawData",
+	[MSC_PEN_ID] = "PenID",		[MSC_PEN_COLOR] "PenColor",
+	[MSC_PEN_LINE_WIDTH] = "PenLineWidth",
+	[MSC_PEN_LINE_STYLE] = "PenLineStyle",
 };
 
 static const char *leds[LED_MAX + 1] = {
-- 
2.25.1

