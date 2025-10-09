Return-Path: <linux-input+bounces-15336-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 27754BC774D
	for <lists+linux-input@lfdr.de>; Thu, 09 Oct 2025 07:45:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E69AB4E2B96
	for <lists+linux-input@lfdr.de>; Thu,  9 Oct 2025 05:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5DC22638AF;
	Thu,  9 Oct 2025 05:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hacktheplanet.fi header.i=@hacktheplanet.fi header.b="cj4ndAVw";
	dkim=pass (2048-bit key) header.d=hacktheplanet.fi header.i=@hacktheplanet.fi header.b="0cpc9th4"
X-Original-To: linux-input@vger.kernel.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532F7262FFC
	for <linux-input@vger.kernel.org>; Thu,  9 Oct 2025 05:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759988705; cv=none; b=m06JIv4QpoVAZ/jFBwrT0zGqD3gh6tX7JLCWwQ8nIh4bcimD/05ptmioSbwNWl9OBxPCJLdn8oLnisSkDQJawkuQR9hskXdcoupB0vPnURKJfzQYESUTD2e5uL4Fgjm8MPygmaM6zEwZ87EipAIVNRXu2QRfK6lF9dCf/2KsIKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759988705; c=relaxed/simple;
	bh=ymF5QvivyGZZ24+symOa+qrVVLxLMLwd6zlIx3cFF64=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XZXDF1JkhvXs1k6r3WdgUilZc/E2UdTqZ4A/Eh7A7cq3Nu7cTIfRxKv2rmSpTMRB9lYmPoCdiL2Pr+OqUvXVrvFMEQW5C4XxwMekS0R15Af7SwDI4tjmRPPXN5BpVd2QalS9p5+r/of9ujAWKvf+7NDl97C4eApFHCH5Gj1QpZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hacktheplanet.fi; spf=pass smtp.mailfrom=hacktheplanet.fi; dkim=pass (2048-bit key) header.d=hacktheplanet.fi header.i=@hacktheplanet.fi header.b=cj4ndAVw; dkim=pass (2048-bit key) header.d=hacktheplanet.fi header.i=@hacktheplanet.fi header.b=0cpc9th4; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hacktheplanet.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hacktheplanet.fi
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=gibson; bh=ymF5QvivyGZZ2
	4+symOa+qrVVLxLMLwd6zlIx3cFF64=; h=subject:to:from:date;
	d=hacktheplanet.fi; b=cj4ndAVwTGTvLnzIlAO1BUW+SnutLIZV3u1yCKL0uiLKxc6B
	ZIq0s0S8PI4LaTZABmWBsv9ceaknEai+abhJD6TBOVhMHh5PNHLDjMMgguwLhr4fsOdXS9
	zrBYg31MEcI9Vjbohp3F/hHJtvhqDSc5zLYKKhKHi3Wcdab1/0aPttuqeplDO2IR07kLVl
	Bqj4AuupJ6cD8WHB0uA5gZ8LPmZMm+n70Rg5Cmo1GVcceoR+boPVI9eBiJnpLsT7u4gQr0
	PykoLzmFi7o7V3TCMqz5qq26V6n5UCL1+9taaOAC/gVqhoA8hLrgSxkq1IMjrPXt47D8eE
	pNLJ/7c3CNrbjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hacktheplanet.fi;
	s=key1; t=1759988690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=HvlgvPfxoRbZPRh2YvgVqdSzcaywXXuT0m7BukFOAgo=;
	b=0cpc9th4kKmLjrJd33us2SNKsXpRMe+XRVhiEEzJSY+DYEp81dhNCzjjMgQxKqS+dqM/VU
	y6vDZ1dGgke1Osf7zZijiplTL8KJonP0YDfuI4L0+CusnvYNCRcbon0pwuslC7WBmvR4VT
	kRTAsubgKP5y4ccI1i8q3BHPJKjNomY4WBhqu4Vuix6kV7X+UHZqOV2LNGuQ+0FjFzYpIj
	1P2d48+LEMveK42HbR1Gf0ncQ2lN+GctpV6udWEp+WX1GlREfpqOPDbJtZlEbacVi5HK4m
	e59xFzJRstGRiV/3xcxj8nIZPLdQXF2P4DNQ4dfwgnxnybm2dalcvGqj0PzdyQ==
Date: Thu, 9 Oct 2025 14:44:36 +0900
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lauri Tirkkonen <lauri@hacktheplanet.fi>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] HID: i2c-hid: patch Lenovo Yoga Slim 7x Keyboard rdesc
Message-ID: <aOdLxAEYQpV2zp77@mail.hacktheplanet.fi>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT

The keyboard of this device has the following in its report description
for Usage (Keyboard) in Collection (Application):

	# 0x15, 0x00,                    //  Logical Minimum (0)                52
	# 0x25, 0x65,                    //  Logical Maximum (101)              54
	# 0x05, 0x07,                    //  Usage Page (Keyboard)              56
	# 0x19, 0x00,                    //  Usage Minimum (0)                  58
	# 0x29, 0xdd,                    //  Usage Maximum (221)                60
	# 0x81, 0x00,                    //  Input (Data,Arr,Abs)               62

Since the Usage Min/Max range exceeds the Logical Min/Max range,
keypresses outside the Logical range are not recognized. This includes,
for example, the Japanese language keyboard variant's keys for |, _ and
\.

Patch the report description to make the Logical range match the Usage
range, fixing the interpretation of keypresses above 101 on this device.

Signed-off-by: Lauri Tirkkonen <lauri@hacktheplanet.fi>
---
 drivers/hid/hid-ids.h              |  1 +
 drivers/hid/i2c-hid/i2c-hid-core.c | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 5721b8414bbd..bbb932145d2c 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -715,6 +715,7 @@
 #define USB_DEVICE_ID_ITE_LENOVO_YOGA2  0x8350
 #define I2C_DEVICE_ID_ITE_LENOVO_LEGION_Y720	0x837a
 #define USB_DEVICE_ID_ITE_LENOVO_YOGA900	0x8396
+#define I2C_DEVICE_ID_ITE_LENOVO_YOGA_SLIM_7X	0x8987
 #define USB_DEVICE_ID_ITE8595		0x8595
 #define USB_DEVICE_ID_ITE_MEDION_E1239T	0xce50
 
diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 63f46a2e5788..d78bd97ec24e 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -740,6 +740,26 @@ static int i2c_hid_raw_request(struct hid_device *hid, unsigned char reportnum,
 	}
 }
 
+static void patch_lenovo_yoga_slim7x_keyboard_rdesc(struct i2c_hid *ihid,
+						    char *rdesc,
+						    unsigned int rsize)
+{
+	if (!(rsize == 0xb0 &&
+	      rdesc[0x34] == 0x15 && rdesc[0x35] == 0x00 && // Logical Minimum (0)
+	      rdesc[0x36] == 0x25 && rdesc[0x37] == 0x65 && // Logical Maximum (101)
+	      rdesc[0x38] == 0x05 && rdesc[0x39] == 0x07 && // Usage Page (Keyboard)
+	      rdesc[0x3a] == 0x19 && rdesc[0x3b] == 0x00 && // Usage Minimum (0)
+	      rdesc[0x3c] == 0x29 && rdesc[0x3d] == 0xdd))  // Usage Maximum (221)
+		return;
+
+	u8 logical_max = rdesc[0x37];
+	u8 usage_max = rdesc[0x3d];
+
+	rdesc[0x37] = usage_max;
+	i2c_hid_dbg(ihid, "%s: patched logical max from %u to %u\n", __func__,
+			logical_max, usage_max);
+}
+
 static int i2c_hid_parse(struct hid_device *hid)
 {
 	struct i2c_client *client = hid->driver_data;
@@ -793,6 +813,11 @@ static int i2c_hid_parse(struct hid_device *hid)
 		}
 	}
 
+	if (ihid->hid->vendor == USB_VENDOR_ID_ITE &&
+	    ihid->hid->product == I2C_DEVICE_ID_ITE_LENOVO_YOGA_SLIM_7X) {
+		patch_lenovo_yoga_slim7x_keyboard_rdesc(ihid, rdesc, rsize);
+	}
+
 	i2c_hid_dbg(ihid, "Report Descriptor: %*ph\n", rsize, rdesc);
 
 	ret = hid_parse_report(hid, rdesc, rsize);
-- 
2.51.0

-- 
Lauri Tirkkonen | lotheac @ IRCnet

