Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5F58394B05
	for <lists+linux-input@lfdr.de>; Sat, 29 May 2021 09:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbhE2H7D (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 29 May 2021 03:59:03 -0400
Received: from smtprelay0207.hostedemail.com ([216.40.44.207]:57892 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229559AbhE2H7C (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 29 May 2021 03:59:02 -0400
Received: from omf16.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay05.hostedemail.com (Postfix) with ESMTP id 1A80B180357EC;
        Sat, 29 May 2021 07:57:26 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf16.hostedemail.com (Postfix) with ESMTPA id 215DE2550F1;
        Sat, 29 May 2021 07:57:25 +0000 (UTC)
Message-ID: <2e9eef2f524d08a9d4be9cf375733f8a5b81d6a7.camel@perches.com>
Subject: Re: [PATCH] hid: hid-chicony: fix switch case indentation
From:   Joe Perches <joe@perches.com>
To:     Navin Sankar Velliangiri <navin@linumiz.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com
Date:   Sat, 29 May 2021 00:57:23 -0700
In-Reply-To: <20210529071808.5268-1-navin@linumiz.com>
References: <20210529071808.5268-1-navin@linumiz.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.90
X-Stat-Signature: nmxco75fry4468ct7yiq8u931tt3g4qf
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: 215DE2550F1
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+RuzOmBNOOuX+5cg1hjxEhvXoXi/TJgB8=
X-HE-Tag: 1622275045-679994
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 2021-05-29 at 12:48 +0530, Navin Sankar Velliangiri wrote:
> fixed switch case indentation.

Please try not to merely fix checkpatch warnings.
Instead try to improve the code.

And there's nothing _really_ wrong with the existing code but:

> diff --git a/drivers/hid/hid-chicony.c b/drivers/hid/hid-chicony.c
[]
> @@ -65,26 +65,61 @@ static int ch_input_mapping(struct hid_device *hdev, struct hid_input *hi,
>  
> 
>  	set_bit(EV_REP, hi->input->evbit);
>  	switch (usage->hid & HID_USAGE) {
> -	case 0xff01: ch_map_key_clear(BTN_1);	break;
> -	case 0xff02: ch_map_key_clear(BTN_2);	break;
[...]
> +	case 0xff01:
> +		ch_map_key_clear(BTN_1);
> +		break;
> +	case 0xff02:
> +		ch_map_key_clear(BTN_2);
> +		break;
[...]
>  	default:
>  		return 0;
>  	}
> +
>  	return 1;

IMO:

This might be (umm) clearer with a separate function.
A lot smaller code too.

$ size drivers/hid/hid-chicony.o*
   text	   data	    bss	    dec	    hex	filename
   1886	    392	      0	   2278	    8e6	drivers/hid/hid-chicony.o.new
   3329	    392	      0	   3721	    e89	drivers/hid/hid-chicony.o.old

Something like:
---
 drivers/hid/hid-chicony.c | 52 +++++++++++++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 22 deletions(-)

diff --git a/drivers/hid/hid-chicony.c b/drivers/hid/hid-chicony.c
index ca556d39da2ae..03e9a1d943d96 100644
--- a/drivers/hid/hid-chicony.c
+++ b/drivers/hid/hid-chicony.c
@@ -54,37 +54,45 @@ static int ch_raw_event(struct hid_device *hdev,
 	return 0;
 }
 
-#define ch_map_key_clear(c)	hid_map_usage_clear(hi, usage, bit, max, \
-					EV_KEY, (c))
+static int map_use_to_btn(int use)
+{
+	switch (use) {
+	case 0xff01: return BTN_1;
+	case 0xff02: return BTN_2;
+	case 0xff03: return BTN_3;
+	case 0xff04: return BTN_4;
+	case 0xff05: return BTN_5;
+	case 0xff06: return BTN_6;
+	case 0xff07: return BTN_7;
+	case 0xff08: return BTN_8;
+	case 0xff09: return BTN_9;
+	case 0xff0a: return BTN_A;
+	case 0xff0b: return BTN_B;
+	case 0x00f1: return KEY_WLAN;
+	case 0x00f2: return KEY_BRIGHTNESSDOWN;
+	case 0x00f3: return KEY_BRIGHTNESSUP;
+	case 0x00f4: return KEY_DISPLAY_OFF;
+	case 0x00f7: return KEY_CAMERA;
+	case 0x00f8: return KEY_PROG1;
+	}
+	return 0;
+}
+
 static int ch_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 		struct hid_field *field, struct hid_usage *usage,
 		unsigned long **bit, int *max)
 {
+	int btn;
+
 	if ((usage->hid & HID_USAGE_PAGE) != HID_UP_MSVENDOR)
 		return 0;
 
 	set_bit(EV_REP, hi->input->evbit);
-	switch (usage->hid & HID_USAGE) {
-	case 0xff01: ch_map_key_clear(BTN_1);	break;
-	case 0xff02: ch_map_key_clear(BTN_2);	break;
-	case 0xff03: ch_map_key_clear(BTN_3);	break;
-	case 0xff04: ch_map_key_clear(BTN_4);	break;
-	case 0xff05: ch_map_key_clear(BTN_5);	break;
-	case 0xff06: ch_map_key_clear(BTN_6);	break;
-	case 0xff07: ch_map_key_clear(BTN_7);	break;
-	case 0xff08: ch_map_key_clear(BTN_8);	break;
-	case 0xff09: ch_map_key_clear(BTN_9);	break;
-	case 0xff0a: ch_map_key_clear(BTN_A);	break;
-	case 0xff0b: ch_map_key_clear(BTN_B);	break;
-	case 0x00f1: ch_map_key_clear(KEY_WLAN);	break;
-	case 0x00f2: ch_map_key_clear(KEY_BRIGHTNESSDOWN);	break;
-	case 0x00f3: ch_map_key_clear(KEY_BRIGHTNESSUP);	break;
-	case 0x00f4: ch_map_key_clear(KEY_DISPLAY_OFF);	break;
-	case 0x00f7: ch_map_key_clear(KEY_CAMERA);	break;
-	case 0x00f8: ch_map_key_clear(KEY_PROG1);	break;
-	default:
+	btn = map_use_to_btn(usage->hid & HID_USAGE);
+	if (!btn)
 		return 0;
-	}
+
+	hid_map_usage_clear(hi, usage, bit, max, EV_KEY, btn);
 	return 1;
 }
 

