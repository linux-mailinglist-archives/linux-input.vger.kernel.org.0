Return-Path: <linux-input+bounces-14549-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6F9B49B88
	for <lists+linux-input@lfdr.de>; Mon,  8 Sep 2025 23:08:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86BF63A410D
	for <lists+linux-input@lfdr.de>; Mon,  8 Sep 2025 21:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B94602749E4;
	Mon,  8 Sep 2025 21:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YX4MG/2j"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0BC1E500C;
	Mon,  8 Sep 2025 21:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757365714; cv=none; b=r+xVvZEzNR+dES9lCBU4QgGzabPYUw5zBf9gG06v20jLHL0144jTNXxSx6WnQDP7/W5a7w9I1aSGA+Tk2Rwg63Zb1xWo9PwmfKHjHvhUCxM4zyWsuYXc5H5axDVfyROzkZyBcSSrDxQ4aR9qb7R0ZMM5/oqb6ojpUh6V5UhDVwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757365714; c=relaxed/simple;
	bh=PnwSzwBS+IEk9VLEaKhhyerfyynPlGeUYEvlHpawoxM=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=nArTooNlZrbKBiTsZDZJqs4+kbpnA9iJKpuHw+egv0hN0IJ7JrA26EodPs1MFM1jF1dI+fhd9Yk1h+zM6RC+2omXTuSS5Ynk6cUquDZjkapjRMRUkup+x8enhwlMRtbKQ2UL/vDDRcZ/iRAE5lxIZaGeoGMj6Rc//Gb3o/vimVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YX4MG/2j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2F96C4CEF1;
	Mon,  8 Sep 2025 21:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757365713;
	bh=PnwSzwBS+IEk9VLEaKhhyerfyynPlGeUYEvlHpawoxM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YX4MG/2j6iLltF3MLeQEUox4oD8IA0Ptm4ATvZGrvVp1Mk0tnXBZGfdxf7S3uUPvC
	 Z+biBVsAmbgm5xIfidgcXyekh92jaHq80Y8gLAULb9otCNNmRxD7aDq8uByxG+twAI
	 ou8n3COdjVim9Y/tn9n0tTlCYEhPxTkIJk9u5Jtcu6O3tVC8FSAQwlImOx/PX+/hOs
	 MfFLDcQB7FVLeIrFGNX12vcxUTSyEk1DBBkPFWFEDLPciSvAKGZ8njajwnYytKHaMa
	 p2TRxDZ6a6oq2BKqudAffn8j//1PRDC4zgSP5CSsOXz2LVb9a11NpNEDsKxRn1phlI
	 ouOOv3YVs6Zfw==
Content-Type: multipart/mixed; boundary="------------Dlpxm7uriiqBCvrDdL5SnNH2"
Message-ID: <c12adb45-fa6d-4bb8-afd2-a02e3026d646@kernel.org>
Date: Mon, 8 Sep 2025 23:08:29 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] HID: lg-g15 - Add support for Logitech G13.
To: "Leo L. Schwab" <ewhac@ewhac.org>
Cc: Kate Hsuan <hpa@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250814212641.197573-2-ewhac@ewhac.org>
 <7d356834-5795-4979-9f51-0ffcec52ae1d@kernel.org>
 <aLSntMknSv3lMarZ@ewhac.org>
 <8ae2cc92-5dfe-466d-95fd-da74309d7244@kernel.org>
 <2de88077-eb8d-44ad-a96a-5db889913cba@kernel.org>
 <aLiZbkKgIC8jIqE9@ewhac.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <aLiZbkKgIC8jIqE9@ewhac.org>

This is a multi-part message in MIME format.
--------------Dlpxm7uriiqBCvrDdL5SnNH2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Leo,

On 3-Sep-25 9:39 PM, Leo L. Schwab wrote:
> 	For some reason, your replies aren't making it to me directly -- I
> had to find and scrape your reply off the LKML web site:
> 
> On Tue, 2 Sep 2025 23:05:06 +0200, Hans de Goede wrote:
>> On 2-Sep-25 22:41, Leo L. Schwab wrote:
>>> 	This does not happen.  The G13 accepts and remembers backlight color
>>> settings even when the LEDs have been toggled off locally.
>>> [ ... ]
>>
>> I see, interesting.
>>
>> So what happens if you turn off the backlight with the toggle button on the G13
>> and then write 0 to brightness in sysfs and then press the toggle button again?
>>
> 	It's a little difficult to see, but the backlight turns back on with
> minimal brightness.  To my eye, it looks like it's displaying #000001.

Ok.

>> Right it does seem that using cdev.brightness_hw_changed is valid in
>> this case.
>>
>> But the LED API is supposed to have the brightness attribute present
>> the actual current brightness of the device.
>>
>> I'm not sure how upower will react if the poll() on brightness_hw_changed
>> wakes upower up and then the reported brightness is unchanged...
>>
>> I need to think about this a bit and check the upower code, let me
>> get back to you on this in a day or 2 ...
>>
> 	Certainly.

Thank you for waiting. After looking at the upower code + running some
tests with a G510 I think that your hw_brightness_changed support
is pretty good as is.

There are 2 improvements which I would like to see:

1. When the backlight is turned on through the button, you
should pass g15_led->brightness to the notify() call rather
then LED_FULL. GNOME will show an OSD with the new brightness
value shown as a mini progress bar similar to how it shows
speaker volume when doing mute/unmute. This mini progress
bar should show the actual brightness being restored, not
always full brightness.

2. ATM if the backlight is turned off on the G13 when
the driver loads and then one of the buttons gets pressed
then a notify() will happen because the led_cdev.hw_brightness_changed
value of -1 will be different from the value of 0 in the
input-report. This notify will lead to an unwanted OSD
notification in GNOME, so this needs to be fixed.
IMHO the best fix would be to use:

	hid_hw_raw_request(..., HID_INPUT_REPORT, HID_REQ_GET_REPORT);

at probe to get the input-report so that the driver will
actually now the backlight state at probe() time without
needing to wait for the first time the input-report is send.

You have inspired me to add hw_brightness_changed support
to the G510 code, see the attached patch. This patch can
also be used as an example how to get the input report
on the G13 during probe().

Note this also adds a variable at the driver level to
track the backlight state also fixing the compile issue
you hit without needing to use #ifdef-ery.

I'll wait for your G13 support to land first and then
rebase the G510 patch on top.

Regards,

Hans




--------------Dlpxm7uriiqBCvrDdL5SnNH2
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-HID-hid-lg-g15-Add-hw_brightness_changed-support-for.patch"
Content-Disposition: attachment;
 filename*0="0001-HID-hid-lg-g15-Add-hw_brightness_changed-support-for.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSAxYzczNWU1ZGRiYTgxNGFjYzU3YTlkMjY4ZWQ3ODUyYmQ0YWE1ODg3IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoYW5zZ0BrZXJuZWwub3Jn
PgpEYXRlOiBNb24sIDggU2VwIDIwMjUgMjI6NTU6MTIgKzAyMDAKU3ViamVjdDogW1BBVENI
XSBISUQ6IGhpZC1sZy1nMTU6IEFkZCBod19icmlnaHRuZXNzX2NoYW5nZWQgc3VwcG9ydCBm
b3IgdGhlCiBHNTEwIGtleWJvYXJkCgpBZGQgaHdfYnJpZ2h0bmVzc19jaGFuZ2VkIHN1cHBv
cnQgZm9yIHRoZSBHNTEwIGtleWJvYXJkLCBzbyB0aGF0IGUuZy4KR05PTUUgd2lsbCBzaG93
IGFuIE9TRCBub3RpZmljYXRpb24gd2hlbiB0b2dnbGluZyB0aGUgYmFja2xpZ2h0IG9uL29m
Zgp3aXRoIHRoZSBidXR0b24gdGhlIGtleWJvYXJkLgoKTm90ZSB0aGF0IGl0IGlzIG5vdCBw
b3NzaWJsZSB0byB0dXJuIHRoZSBiYWNrbGlnaHQgYmFjayBvbiBieSB3cml0aW5nCi9zeXMv
Y2xhc3MvbGVkcy8uLi4vYnJpZ2h0bmVzcyBpdCBjYW4gb25seSBiZSB0dXJuZWQgb24gYnkg
cHJlc3NpbmcKdGhlIGJ1dHRvbiBvbiB0aGUga2V5Ym9hcmQuIFRvIHJlZmxlY3QgdGhpcyAv
c3lzL2NsYXNzL2xlZHMvLi4uL2JyaWdodG5lc3MKd2lsbCBhbHdheXMgcmVwb3J0IHRoZSBs
YXN0IGJyaWdodG5lc3MgdmFsdWUgaW5kZXBlbmRlbnQgb2YgdGhlIG9uL29mZgp0b2dnbGUg
YnVpbHQgaW50byB0aGUga2V5Ym9hcmQuCgpTaWduZWQtb2ZmLWJ5OiBIYW5zIGRlIEdvZWRl
IDxoYW5zZ0BrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvaGlkL2hpZC1sZy1nMTUuYyB8IDM3
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAzNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvaGlkL2hpZC1sZy1nMTUuYyBiL2RyaXZlcnMvaGlkL2hpZC1sZy1nMTUuYwppbmRleCBm
ODYwNTY1NjI1N2IuLmU1YmUyYTVkZmE2NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9oaWQvaGlk
LWxnLWcxNS5jCisrKyBiL2RyaXZlcnMvaGlkL2hpZC1sZy1nMTUuYwpAQCAtMjYsNiArMjYs
OSBAQAogI2RlZmluZSBMR19HNTEwX0ZFQVRVUkVfQkFDS0xJR0hUX1JHQgkweDA1CiAjZGVm
aW5lIExHX0c1MTBfRkVBVFVSRV9QT1dFUl9PTl9SR0IJMHgwNgogCisjZGVmaW5lIExHX0c1
MTBfSU5QVVRfTUFDUk9fS0VZUwkweDAzCisjZGVmaW5lIExHX0c1MTBfSU5QVVRfS0JEX0JB
Q0tMSUdIVAkweDA0CisKIGVudW0gbGdfZzE1X21vZGVsIHsKIAlMR19HMTUsCiAJTEdfRzE1
X1YyLApAQCAtNjcsNiArNzAsNyBAQCBzdHJ1Y3QgbGdfZzE1X2RhdGEgewogCWVudW0gbGdf
ZzE1X21vZGVsIG1vZGVsOwogCXN0cnVjdCBsZ19nMTVfbGVkIGxlZHNbTEdfRzE1X0xFRF9N
QVhdOwogCWJvb2wgZ2FtZV9tb2RlX2VuYWJsZWQ7CisJYm9vbCBiYWNrbGlnaHRfZGlzYWJs
ZWQ7CiB9OwogCiAvKioqKioqKiogRzE1IGFuZCBHMTUgdjIgTEVEIGZ1bmN0aW9ucyAqKioq
KioqKi8KQEAgLTIyNyw2ICsyMzEsMjAgQEAgc3RhdGljIGludCBsZ19nNTEwX2dldF9pbml0
aWFsX2xlZF9icmlnaHRuZXNzKHN0cnVjdCBsZ19nMTVfZGF0YSAqZzE1LCBpbnQgaSkKIAkJ
ZzE1LT5sZWRzW2ldLmJyaWdodG5lc3MgPSAwOwogCX0KIAorCWlmIChpKQorCQlyZXR1cm4g
MDsKKworCXJldCA9IGhpZF9od19yYXdfcmVxdWVzdChnMTUtPmhkZXYsIExHX0c1MTBfSU5Q
VVRfS0JEX0JBQ0tMSUdIVCwKKwkJCQkgZzE1LT50cmFuc2Zlcl9idWYsIDIsCisJCQkJIEhJ
RF9JTlBVVF9SRVBPUlQsIEhJRF9SRVFfR0VUX1JFUE9SVCk7CisJaWYgKHJldCAhPSAyKSB7
CisJCS8qIFRoaXMgY2FuIGhhcHBlbiB3aGVuIGEgS1ZNIHN3aXRjaCBpcyB1c2VkLCBzbyBv
bmx5IHdhcm4uICovCisJCWhpZF93YXJuKGcxNS0+aGRldiwgIkVycm9yIGdldHRpbmcgYmFj
a2xpZ2h0IHN0YXRlOiAlZFxuIiwgcmV0KTsKKwkJcmV0dXJuIDA7CisJfQorCisJZzE1LT5i
YWNrbGlnaHRfZGlzYWJsZWQgPSBnMTUtPnRyYW5zZmVyX2J1ZlsxXSAmIDB4MDQ7CisKIAly
ZXR1cm4gMDsKIH0KIApAQCAtNTQ5LDE0ICs1NjcsMjQgQEAgc3RhdGljIGludCBsZ19nNTEw
X2V2ZW50KHN0cnVjdCBsZ19nMTVfZGF0YSAqZzE1LCB1OCAqZGF0YSkKIAogc3RhdGljIGlu
dCBsZ19nNTEwX2xlZHNfZXZlbnQoc3RydWN0IGxnX2cxNV9kYXRhICpnMTUsIHU4ICpkYXRh
KQogeworCXN0cnVjdCBsZ19nMTVfbGVkICpnMTVfbGVkID0gJmcxNS0+bGVkc1tMR19HMTVf
S0JEX0JSSUdIVE5FU1NdOwogCWJvb2wgYmFja2xpZ2h0X2Rpc2FibGVkOwogCisJYmFja2xp
Z2h0X2Rpc2FibGVkID0gZGF0YVsxXSAmIDB4MDQ7CisJaWYgKGJhY2tsaWdodF9kaXNhYmxl
ZCA9PSBnMTUtPmJhY2tsaWdodF9kaXNhYmxlZCkKKwkJcmV0dXJuIDA7CisKKwlsZWRfY2xh
c3NkZXZfbm90aWZ5X2JyaWdodG5lc3NfaHdfY2hhbmdlZCgKKwkJJmcxNV9sZWQtPm1jZGV2
LmxlZF9jZGV2LAorCQliYWNrbGlnaHRfZGlzYWJsZWQgPyAwIDogZzE1X2xlZC0+YnJpZ2h0
bmVzcyk7CisKKwlnMTUtPmJhY2tsaWdodF9kaXNhYmxlZCA9IGJhY2tsaWdodF9kaXNhYmxl
ZDsKKwogCS8qCiAJICogVGhlIEc1MTAgaWdub3JlcyBiYWNrbGlnaHQgdXBkYXRlcyB3aGVu
IHRoZSBiYWNrbGlnaHQgaXMgdHVybmVkIG9mZgogCSAqIHRocm91Z2ggdGhlIGxpZ2h0IHRv
Z2dsZSBidXR0b24gb24gdGhlIGtleWJvYXJkLCB0byB3b3JrIGFyb3VuZCB0aGlzCiAJICog
d2UgcXVldWUgYSB3b3JraXRlbSB0byBzeW5jIHZhbHVlcyB3aGVuIHRoZSBiYWNrbGlnaHQg
aXMgdHVybmVkIG9uLgogCSAqLwotCWJhY2tsaWdodF9kaXNhYmxlZCA9IGRhdGFbMV0gJiAw
eDA0OwogCWlmICghYmFja2xpZ2h0X2Rpc2FibGVkKQogCQlzY2hlZHVsZV93b3JrKCZnMTUt
PndvcmspOwogCkBAIC01ODgsOSArNjE2LDkgQEAgc3RhdGljIGludCBsZ19nMTVfcmF3X2V2
ZW50KHN0cnVjdCBoaWRfZGV2aWNlICpoZGV2LCBzdHJ1Y3QgaGlkX3JlcG9ydCAqcmVwb3J0
LAogCQlicmVhazsKIAljYXNlIExHX0c1MTA6CiAJY2FzZSBMR19HNTEwX1VTQl9BVURJTzoK
LQkJaWYgKGRhdGFbMF0gPT0gMHgwMyAmJiBzaXplID09IDUpCisJCWlmIChkYXRhWzBdID09
IExHX0c1MTBfSU5QVVRfTUFDUk9fS0VZUyAmJiBzaXplID09IDUpCiAJCQlyZXR1cm4gbGdf
ZzUxMF9ldmVudChnMTUsIGRhdGEpOwotCQlpZiAoZGF0YVswXSA9PSAweDA0ICYmIHNpemUg
PT0gMikKKwkJaWYgKGRhdGFbMF0gPT0gTEdfRzUxMF9JTlBVVF9LQkRfQkFDS0xJR0hUICYm
IHNpemUgPT0gMikKIAkJCXJldHVybiBsZ19nNTEwX2xlZHNfZXZlbnQoZzE1LCBkYXRhKTsK
IAkJYnJlYWs7CiAJfQpAQCAtNjI0LDYgKzY1Miw5IEBAIHN0YXRpYyB2b2lkIGxnX2cxNV9z
ZXR1cF9sZWRfcmdiKHN0cnVjdCBsZ19nMTVfZGF0YSAqZzE1LCBpbnQgaW5kZXgpCiAJZzE1
LT5sZWRzW2luZGV4XS5tY2Rldi5sZWRfY2Rldi5tYXhfYnJpZ2h0bmVzcyA9IDI1NTsKIAln
MTUtPmxlZHNbaW5kZXhdLm1jZGV2Lm51bV9jb2xvcnMgPSAzOwogCisJaWYgKGluZGV4ID09
IExHX0cxNV9LQkRfQlJJR0hUTkVTUykKKwkJZzE1LT5sZWRzW2luZGV4XS5tY2Rldi5sZWRf
Y2Rldi5mbGFncyA9IExFRF9CUklHSFRfSFdfQ0hBTkdFRDsKKwogCXN1YmxlZF9pbmZvID0g
ZGV2bV9rY2FsbG9jKCZnMTUtPmhkZXYtPmRldiwgMywgc2l6ZW9mKCpzdWJsZWRfaW5mbyks
IEdGUF9LRVJORUwpOwogCWlmICghc3VibGVkX2luZm8pCiAJCXJldHVybjsKLS0gCjIuNTEu
MAoK

--------------Dlpxm7uriiqBCvrDdL5SnNH2--

