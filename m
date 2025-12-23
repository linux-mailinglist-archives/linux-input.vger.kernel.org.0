Return-Path: <linux-input+bounces-16681-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C42ECDA605
	for <lists+linux-input@lfdr.de>; Tue, 23 Dec 2025 20:35:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4BC73007979
	for <lists+linux-input@lfdr.de>; Tue, 23 Dec 2025 19:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39D363043BE;
	Tue, 23 Dec 2025 19:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=mircomat@web.de header.b="CTd6S/4q"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DD122D7B1;
	Tue, 23 Dec 2025 19:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766518531; cv=none; b=o1+EBOjmd0nW6kivIK5WB1lIvHcu09p/W8+oq4xpTt85tsVkD2UC1KMAEVVz/FT0WvQo/2soqK9UAqWbAWmekAEYA6qCKWCktFWTmVLr85rAjzSARrZMwRd2HZC0ZRMX7DG3Y0FCLf5fbkwHMGvEXjgDbnpyjhib27CDfnLPBOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766518531; c=relaxed/simple;
	bh=7+n5p60tFER5qzafWkzdbKQIvtBxcKx/h+bYgBIt4Jw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=RLu733GKHe4zOwMUMBzJrGPoKJxPy8dPUA3a31k42WCoyyGDXXPQdVRBziNCCLuqumLfEcGK9KrdQR8jRG8sXC27NuAZti9SH28xYEMlfPxINZh+SzX09FuSksZA+KzoAUQji8tFoLCiqJ5+iYDhQSnzZZsHAGh2/jWOtJ4O+Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=mircomat@web.de header.b=CTd6S/4q; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1766518518; x=1767123318; i=mircomat@web.de;
	bh=7+n5p60tFER5qzafWkzdbKQIvtBxcKx/h+bYgBIt4Jw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=CTd6S/4qzvMPbMquQgilEqHK+7o0zPlYyRxUG0LLmoRPZRMeP5zffru8wX7dLaA/
	 WbGouP7VvqMTNzasP3CwNRSu31007Jgkv028Zw9Ort9cOTYe0TEhfn+l3Aq192ui1
	 Qe6AmZJfi+VL1Ygo0gV+Dg0wnCR8N0qQeq0H0U/gJQRnLxMWxk0dX89WfIblmzpds
	 QZXb9ZJiVwN5dRN0hvQmGs+Xz9JiIk8HwDWapByqGibySkmXlHrjSwat2gDoBfr/v
	 /AeGrA7m6UFST+AJydalArJy/4Xxt0DpHsckOSeIySvnXsQ32AJzHiwRGrR61QpyE
	 DolreFFI7dIORi/y+g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.23] ([109.250.178.209]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MPaMS-1vKKMm1Vac-00WGaS; Tue, 23
 Dec 2025 20:35:18 +0100
Message-ID: <4c0a34ca-145b-4037-8325-860ed55f1700@web.de>
Date: Tue, 23 Dec 2025 20:35:17 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [REGRESSION] Touchpad stops working on Trekstor Primebook C13 after
 Kernel 6.8.0-51
From: Mirco Kramer <mircomat@web.de>
To: jkosina@suse.cz, bentiss@kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <cf6f5773-029b-40ea-bf3f-f8231eec7e20@web.de>
Content-Language: en-US
In-Reply-To: <cf6f5773-029b-40ea-bf3f-f8231eec7e20@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+BXJ+mfIdxYK6tNn3sF9ERN8Plgw6mT8kcWOpzsFJRzjn8YFmu7
 QNz0c15VSIzWVtUbXpByx6I+rDxUvu1FtmppChDs//flEgfx5XUmNXUXkDIQXYFP1q63xre
 6L4Lmb5qNOuwWDdsuiQDdGpiggG5FwayTkVBNl5YmvV97+jiVBWoV+RQcPLmL8v3FeimlPH
 DVYPmKGAtWTowLS0dLA/g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Y9c2vtXLrJQ=;ieUmhjR+tmYxKvpUXxfILigvm0c
 IMo+5UysJEthRgHH8gLyAya+Oo0sGD4Ljzf6cjt05im7+j3GyS3OFzb/3OM5pgdhbvms7j6zD
 9EEz9pGhu39ZIAXy+X4chVuQIpe0xicIXiHDKX3mjvdpH6N693KuavHlkXyi3dakPv2baPwf4
 T+MeAe451AULzq1qf4zmdb00XW5CwtywAd1/BDnLJVoBGyxCihKAo3Ve04BIT3YnpH4bwAjxZ
 MOXYCLmTrwRsuQ3Tg3SdIip8WjYPXO2OOPdQazwW85kxwVGa/rRUbxjBfoqe8wsTf9vIr+hkh
 Z4EnN0SI+0SOQ2clUkT7Pcl2B2UxaEOxto6z2BPqePOs2TA6xYRCBowJ3hDrdxCD/LjYKfhhi
 LmTWfnpKel7yAp+Q4TVFkksCfD+PG/B1uN9ab7729yDctCYwVrDskRqfLgPmWMPSo9wjBhUWZ
 bYngnGUJ/pQaCzArt8QrXPPDj2hHXvM6GQjENFJ88OgFcrry9H5wPEQieRO8VQncq+2SRRq+C
 cLiySvfgBSg3+DjLWHHqbr3oOTqb+OmIQsR/pfGqEzJpA6A6i0CM7I6j8/hsmsMN+AUGi5sNH
 7b+1OcYiDB0D6P40QPDen7Vwyl6vxiPXnlav3fAdL4t29nfChiGAmpgUuv5QYQfQP/E3fSMlN
 ywwokTaz0NAYUT2qJLdjVmYG7KETYMmbbdMVfzJnG3CIeXAZ9qmwDYOovSDdEa0OyvcrX/4YH
 9+QJIhEnrRZd6ZtqiM+Th7T42cINF0ZJpZ9dGmVoUdJLmZXorvfXFq6Pl5q9ZDlR4cy6iNZyF
 Co1NlX/7Tau0zwBn4u5YVJqxa0rgIWt2ycuX5sY8QABRFlITxqiZ7pw7GvwIpkblncpWwd56E
 8wQ6xJyHbZK2RRH7d++dOlFrwFPk1ONUBg6kFahsaO0Nd49oaaM402FW8oabFG5RCOV5gBHld
 cuOBv87lOiRmpyzpQdP3KbUw3RGEWl965JT3KI1r65WCEFCZLJsDl6Bu52t5JM9kXBBoMozY3
 bZcwXXH1tx3J6fCHnQNSucCNo6XIXxRpMx9PUrWrzC3RH/X6BXiZR6tHvpcqo73XCaVWGTWQK
 JHa1WJrahgpvUgQyCVdIED5fHN6buzfreUDrFuYqS8AQLy7Aaqlw1FZn2C0tDIwG1H338skTI
 mrK0mhQdHvYvq6y4lHYQLQYOn04FC92eC0KmirPSfD6l46TSiJbmm9ZAnOEpZWYrtIlJ1bXrd
 6/Yb4K18/zRcyqEzeXHrZ9OhLznJuMIuZp9zkDaunafUtjgLothyxR2aWSahM4b46s8Wfy0Hg
 GET991EgwEmiVBCATi1LuQBaj6NfQqARaVqiyP+BPBQyAKLKvlLoG0fzrN/SKZQ4nCP9TukHP
 NUCmxtdHcd2J+tLnJcOFxKHeHQNDp0BV/Oi8V8TYnyMwwvxjX/jPIVoVR0NQxqThzumf1rB8M
 x0GwhUjVRn7ahXh+GQMQutQsSCGlgpYgvjAm5+VWfjj8wyjbwjQQ3jXAeGydfIN5gz0HjedkM
 Nzgl4HVxru3aGn8F/F7JMoLkh4nXl+qjsR7zxg/UpbUki5qx7dRlPsOuS7gMETUz32N4WAHPy
 7jJa4NrXKUMOBAx6zimmuppL/6zBm2gmYPbTYCgqMpA/94oe0nq4UUqJuuH566EO+oaijZNu4
 MK1eUuGjNJZ49f69a/ZoJfRpUr3IAKHVdO2BeDPRXjQyowWkYB9O7DgqKOPoTYWa/RItu6gHL
 k4DpLqvK1/DWnheuNY205t7001Cf5/QLllF6MykcKUbmpGK7zueKxjUe7VZ4M6gFPu/C/pQES
 BKiqTJhWT17oLt68/E0h7+5qtrn3LvaZVz8iUa6/SRoJl3G0SmhSOnogNVK0Z8XNr62oltlwC
 NYtsYOCB1IM7ul8eaF/Z+oPlHeLIxb+yxseTvOFETL+/FPL6Vi55Yd08bEH2BUZytCcvRlBBH
 +G9cnED+stR0RldkO8MM4dvX2F6DJTCvagj8ZVqS3jWS1Rg+EKe+ytkfj22ArwtjbxPU1LUoN
 WowhCVISf3hp4afMtEFgIcs8d9rQ+dt7ixZYm2ww1wqGXrKziL5PJmfNLI9ZiDVrR+Mq0BxOu
 964sshiKmMROX5AK8QlEyHBm3xdE6iNVKmbjlCSgUFxJe3onCC7trXPESBtDtK6ztpbaRt9mq
 fXzZP6W/1v7q7e5rhxCjq6J9mqJBv49XK+DpMBRuFQiIcYUXuG2Kmq4lcj17hP5q9srL2rDz1
 djHP5bw41f41w+KcqcsaGfqY08XRlGojEDbRM62uMSzDP2fxfIxe26bwEO0ueYoYWv1QEw2Q+
 MdRStZ4yzK1wTnHSMQswAw4/r9DbtEeEDjoSwYCQFNFWl2wxg/TVrCxUQDe0F6x9XDzCIZJUU
 27wbZ0niD7u0HtMnJyq7BB5ruXvdEaDLzLXZ2M85FNj9TNAYPq8FTIzavhO7WQY8lBznclVd0
 oZAkovtThDXucEstzFrmNPuBATUAKu8S4qvfubJeTp5AlvHIbGKTHhXDStYQZ2bs0VV8t6i/u
 hv245CvEwiHBnEw+5rBDOQb2gqnIzobqE84xLRHhUjKeBbJkHZqxmQRMjiNDRAtTUZYhjiTq0
 YOMAS3YMNdMWAzH+3NDaSbxqt0fn+RkQkynfG0e5vhiz6QetJ/oxYnvSEBMbRDL6PBtAjWdlI
 KqhtwDgGJfSvJNAJpZnSJ+twIXH0+w6vSHfb+yTH8xEGVb0s9EQdI0Zq6rYFOGbLZtq8bSOL4
 QTZl5eChqmhomr9zjPMi41JdEDX1q57e0V4c6g17hirp1ZmDCuGuEFFC3l1poFKctAkQvJqfy
 4B51/kA2RF5d6Nymx3uBbeeX6i2lqUVNYJcY4XjxsC+NwiPeX7EC1/2jGi3hMuA9XWgCYk7PO
 Nz30TjXCEoVuZ3vpkoiAsQw3R6l5GKVoUQAOE9BDl+Fqte4YsJEXhb4Jkvs2/GkWT3DcrWS3v
 rTfSt241gErVzxTSFsJCD/GEihb3hUX0TP4Y5U66dyCEzYd8rcIttFNp+C7Z/LIjnxzkO95ay
 ksG3VedUf+6V2JVrRcOoumJEHKa8hAsKpy1DdBVVJ1WY88SYFsYpvEgt/HZWebWQlGBxeE664
 Nkpq2mr4K1P4e12JCYhPtF69pXLMJxfxwOdA4XqaT392xZv6jwU+47zwgPrZjADzA7TvGIljr
 KjkpN6w8mnt3WZESb295Y+fX2/XnvLsKf/nMjIXfacEVWzobH7iUuMZI2jNemdqs86a+PK6W0
 HeU7k32em9KBPZepxrYbrMnuOcmX435mumOxgaFO4w7bMfgJmwwsDiN7L96m91ExcXe8tLvrQ
 bf+wNVOWYXd/C26xQglZjwZI5yYA5zeYBAqPnNylaqDyCSBWbezOp60bIiDQhDMZEpB29nAU9
 Fm8vZsb+WTEbVRFmeR6UKeckFAlbg3XdBTv9SgcEyap20EE7BacwBXRjUNgJgLXU+Xtgs49c/
 RUoc9djMd7ChcAhOScEE7rUqO85BdteM63mfzDO4c/owaSP8rk2Zprn1Tn7EsX/ntopP7eKug
 Hu5c+rJa5k+blj4+cIVV20zc0tnCqYa/Z5TMtKnNtraCsSr3PlCp+WZOtQyaYVsD98YimI6Gd
 biFXP/4V+WSViVBwo1jOvtAr7dBFjXor2qfNz40Idayn/Q5rqIFoi6RLFMAUjQfWLXtso+Lvr
 IuovHB4IBKnqXTi59JaonM1hwvml7Kc2E4xdMs2hQhK+FDmoXzM3+tm/+67gq6I+C9g06ZUPR
 WXFukMTxXgS75FB0Z35z0vYNBKywrDWYXi1EcV+NpZE5So66LkPYNZ8eRiyaYv/l43+4jZ2De
 oJUlReaDH4hdoZI0YD0I4lDRynCzz3RR40x6DouYmNQWCeF711B4DAIJBJLd7/xtukP3f8fsp
 2E/6QiZy7oT1uMlotMyjUHwQE1wiMDe4u4fEAeuF6XHNuBxO9ovxHCccXN+pNBLSP7QcfveCS
 1RZkmDSJ/tXsvvc2gB1IdnvzVTp6H3goyBywSdFGew3X3dFR3NT8+KsM8Ev+Ux0hTCU+eoenS
 PziWwAHaNltr8f23Gmw5Mgu1kJGmcjHcI8GuAIRGKYcHY4W6oGyJFP+UiKEbz50k/vHOutnGU
 T+3Xz6PANOQnIgfV5Prgf0wsdPFi/HMMi2ejHbOECleK5GntLlNVb0KQZK9pC72u8qMkEx2Pw
 SCt1ndcjKvBOrGbw04fhkjoLXsjlpHOJV2JuAjS/RAdS5EHoX8G/dXNXY/IXLyBEQ2H8HM3Qx
 tWoXMcvuc85I8wha66x17lzdU634LCtRZLHsKhdqME+3T2XVhzOV78nk3Oq5U68PNsImtYydx
 pqN52yv1hv/z0Ev4ebCWx9oeSVcpITx/nxgU9CL6GIuV3Ej+el9UvejBeaOiApVy7/df/8F2F
 ilOaKamfWKl4mUXHydgxCaM+mWt6CsNWKkPPblLaQjAgZySckDCk6gsAHpR8tJKtCP0UgFVCb
 Old7ECp+2F9a+unvo5PHTM9zIQcqboL2RwXIcWArE/wRVut6YC9iq3+ZGwm0f84z/FYZNTtCk
 b0EUBNYIDs8Ja5i/YjZ831Ysvc3ypnWKtojGHBmYIi39M4WQFJmRsLS+U+96jBvSUKWmRVY/R
 tNaipjVPIZ6vRdoeiaEQPWnSImA9yo1A5YQibXdGDj1EwyYKdU2scQxdvnrjtF6CBtp7J2pd4
 7CRjtlTdOxBTQc/GhTArsakesCFXpBil7/FPHOqWOZcAyEJ36hIlnj9bBJUjSZVUD2B4yMVyd
 CowMWBNNfS6c1V5byE9utbi3GKyuZYkIc40fWAJau4VHWBQdVzNaKi0gQ49vE4wFXLM3JO+Si
 61ycZevNZHE5ZR7UyYTIL/2RfZEA06vrLNLl/vizBVP3p7PFLNlgQf/CeujRhU5a7OAJ/R1q6
 k2JadAE1sigdNpSBoL0C0F4ITyWszX3ykaXc6OVsiyzlblwtHuHAZ2XJMgL3dJ7W3UriMjueD
 VCSdBkzNxRysDpeT30iz+RmYQMRKV94MZziCecX2KnxD40VdDZjTM5wKEz1UqnHF6rPFZtcXg
 07XUSDT5OhLmP7R/TFwrYnblDJ/tkGBHQyvT+ULyAMXOCvKaonaCR2yNMguwmvsW3KZZT2aj0
 y0HUS5DWaiHXOfxJaT5WIIy3/Hon9cz3X5HBy5d5Fmqof5mpjc69zSe96fiQdUrOmygQZypEX
 WCKY0qLfaeFpxJq9MIzPQaLbptYbkgFsKVHQQV37TzlMT1sE9HNJBCIK6m19IXV1caUyhFbVa
 H6OBqH7/UUcg8hS/GUOq

Subject: [REGRESSION] Touchpad stops working on Trekstor Primebook C13=20
after Kernel 6.8.0-51

*Description:* After updating from kernel 6.8.0-51 to 6.8.0-68, the=20
touchpad on my Trekstor Primebook C13 was no longer functional. It=20
appears to be an issue with the i2c-hid subsystem on the Apollo Lake=20
platform.

*Specific Symptom:* > "In 6.8.0-68 and -90, the touchpad fails to track=20
a single finger. However, if a second finger is placed stationary on the=
=20
touchpad surface, the first finger can move the cursor normally. This=20
suggests a regression in I2C-HID interrupt handling or event filtering=20
(possibly related to 'Confidence' bits or 'Contact' reporting)."

*Regression:*
 =C2=A0 =C2=A0Last known working kernel: 6.8.0-51
 =C2=A0 =C2=A0First known broken kernel: 6.8.0-68

*Hardware:*

 =C2=A0=C2=A0 Device: Trekstor Primebook C13
 =C2=A0 =C2=A0Bus: I2C (HID-over-I2C)

*Additional Info:* I suspect a change in the i2c-designware or i2c-hid=20
drivers between these sub-versions might be the cause.

System:
 =C2=A0 Kernel: 6.8.0-51-generic arch: x86_64 bits: 64 compiler: gcc v: 13=
.3.0
 =C2=A0 =C2=A0 clocksource: tsc
 =C2=A0 Desktop: MATE v: 1.26.2 wm: marco v: 1.26.2 with: mate-panel
 =C2=A0 =C2=A0 tools: mate-screensaver vt: 7 dm: LightDM v: 1.30.0
 =C2=A0 =C2=A0 Distro: Linux Mint 22.2 Zara base: Ubuntu 24.04 noble
Machine:
 =C2=A0 Type: Convertible System: TREKSTOR product: Primebook C13 v: N/A
 =C2=A0 =C2=A0 serial: <superuser required>
 =C2=A0 Mobo: TS_weibu model: Apollolake_alk_V01 serial: <superuser requir=
ed>
 =C2=A0 =C2=A0 part-nu: CFALKWW02464 uuid: <superuser required> UEFI: Amer=
ican=20
Megatrends
 =C2=A0 =C2=A0 v: BIOS_V1.2.9_20171026 date: 10/26/2017
Battery:
 =C2=A0 ID-1: BAT0 charge: 26.4 Wh (66.0%) condition: 40.0/40.0 Wh (100.0%=
)
 =C2=A0 =C2=A0 power: 4.2 W volts: 7.4 min: N/A model: Intel SR 1 SR Real =
Battery
 =C2=A0 =C2=A0 type: Unknown serial: <filter> status: discharging
CPU:
 =C2=A0 Info: dual core model: Intel Celeron N3350 bits: 64 type: MCP
 =C2=A0 =C2=A0 smt: <unsupported> arch: Goldmont rev: 9 cache: L1: 112 KiB=
 L2: 2 MiB
 =C2=A0 Speed (MHz): avg: 798 high: 800 min/max: 800/2400 cores: 1: 796 2:=
 800
 =C2=A0 =C2=A0 bogomips: 4377
 =C2=A0 Flags: ht lm nx pae sse sse2 sse3 sse4_1 sse4_2 ssse3 vmx
Graphics:
 =C2=A0 Device-1: Intel HD Graphics 500 driver: i915 v: kernel arch: Gen-9=
=20
ports:
 =C2=A0 =C2=A0 active: eDP-1 empty: DP-1,HDMI-A-1 bus-ID: 00:02.0 chip-ID:=
 8086:5a85
 =C2=A0 =C2=A0 class-ID: 0300
 =C2=A0 Device-2: Alcor Micro USB 2.0 PC Camera driver: snd-usb-audio,uvcv=
ideo
 =C2=A0 =C2=A0 type: USB rev: 2.0 speed: 480 Mb/s lanes: 1 bus-ID: 1-8:4 c=
hip-ID:=20
058f:3841
 =C2=A0 =C2=A0 class-ID: 0102
 =C2=A0 Display: x11 server: X.Org v: 21.1.11 with: Xwayland v: 23.2.6
 =C2=A0 =C2=A0 compositor: marco v: 1.26.2 driver: X: loaded: modesetting
 =C2=A0 =C2=A0 unloaded: fbdev,vesa dri: iris gpu: i915 display-ID: :0 scr=
eens: 1
 =C2=A0 Screen-1: 0 s-res: 1600x900 s-dpi: 96 s-size: 423x238mm (16.65x9.3=
7")
 =C2=A0 =C2=A0 s-diag: 485mm (19.11")
 =C2=A0 Monitor-1: eDP-1 model: Najing CEC Panda LC133LF2L01 res: 1600x900=
=20
hz: 60
 =C2=A0 =C2=A0 dpi: 138 size: 294x165mm (11.57x6.5") diag: 337mm (13.3") m=
odes:=20
1920x1080
 =C2=A0 API: EGL v: 1.5 hw: drv: intel iris platforms: device: 0 drv: iris
 =C2=A0 =C2=A0 device: 1 drv: swrast gbm: drv: iris surfaceless: drv: iris=
 x11:=20
drv: iris
 =C2=A0 =C2=A0 inactive: wayland
 =C2=A0 API: OpenGL v: 4.6 compat-v: 4.5 vendor: intel mesa
 =C2=A0 =C2=A0 v: 25.0.7-0ubuntu0.24.04.2 glx-v: 1.4 direct-render: yes re=
nderer:=20
Mesa
 =C2=A0 =C2=A0 Intel HD Graphics 500 (APL 2) device-ID: 8086:5a85
Audio:
 =C2=A0 Device-1: Intel Celeron N3350/Pentium N4200/Atom E3900 Series Audi=
o=20
Cluster
 =C2=A0 =C2=A0 driver: snd_hda_intel v: kernel bus-ID: 00:0e.0 chip-ID: 80=
86:5a98
 =C2=A0 =C2=A0 class-ID: 0403
 =C2=A0 Device-2: Alcor Micro USB 2.0 PC Camera driver: snd-usb-audio,uvcv=
ideo
 =C2=A0 =C2=A0 type: USB rev: 2.0 speed: 480 Mb/s lanes: 1 bus-ID: 1-8:4 c=
hip-ID:=20
058f:3841
 =C2=A0 =C2=A0 class-ID: 0102
 =C2=A0 API: ALSA v: k6.8.0-51-generic status: kernel-api
 =C2=A0 Server-1: PipeWire v: 1.0.5 status: active with: 1: pipewire-pulse
 =C2=A0 =C2=A0 status: active 2: wireplumber status: active 3: pipewire-al=
sa type:=20
plugin
Network:
 =C2=A0 Device-1: Intel Wireless 3165 driver: iwlwifi v: kernel pcie:
 =C2=A0 =C2=A0 speed: 2.5 GT/s lanes: 1 bus-ID: 01:00.0 chip-ID: 8086:3165=
=20
class-ID: 0280
 =C2=A0 IF: wlp1s0 state: up mac: <filter>
Bluetooth:
 =C2=A0 Device-1: Intel Bluetooth wireless interface driver: btusb v: 0.8=
=20
type: USB
 =C2=A0 =C2=A0 rev: 2.0 speed: 12 Mb/s lanes: 1 bus-ID: 1-7:3 chip-ID: 808=
7:0a2a
 =C2=A0 =C2=A0 class-ID: e001
 =C2=A0 Report: hciconfig ID: hci0 rfk-id: 1 state: down
 =C2=A0 =C2=A0 bt-service: enabled,running rfk-block: hardware: no softwar=
e: yes
 =C2=A0 =C2=A0 address: <filter>
Drives:
 =C2=A0 Local Storage: total: 87.97 GiB used: 33.99 GiB (38.6%)
 =C2=A0 ID-1: /dev/mmcblk0 vendor: HP model: DF4064 size: 58.24 GiB
 =C2=A0 =C2=A0 type: Removable tech: SSD serial: <filter> fw-rev: 0x8 sche=
me: GPT
 =C2=A0 ID-2: /dev/mmcblk1 model: SU32G size: 29.72 GiB type: USB tech: SS=
D
 =C2=A0 =C2=A0 serial: <filter> scheme: MBR
Partition:
 =C2=A0 ID-1: / size: 56.53 GiB used: 30.52 GiB (54.0%) fs: ext4 dev:=20
/dev/mmcblk0p2
 =C2=A0 ID-2: /boot/efi size: 511 MiB used: 6.1 MiB (1.2%) fs: vfat
 =C2=A0 =C2=A0 dev: /dev/mmcblk0p1
Swap:
 =C2=A0 ID-1: swap-1 type: file size: 3.98 GiB used: 738.2 MiB (18.1%)=20
priority: -2
 =C2=A0 =C2=A0 file: /swapfile
Sensors:
 =C2=A0 System Temperatures: cpu: 46.0 C mobo: N/A
 =C2=A0 Fan Speeds (rpm): N/A
Repos:
 =C2=A0 Packages: 1931 pm: dpkg pkgs: 1923 pm: flatpak pkgs: 8
 =C2=A0 No active apt repos in: /etc/apt/sources.list
 =C2=A0 Active apt repos in:=20
/etc/apt/sources.list.d/official-package-repositories.list
 =C2=A0 =C2=A0 1: deb https://ftp.fau.de/mint/packages zara main upstream =
import=20
backport
 =C2=A0 =C2=A0 2: deb http://ftp.fau.de/ubuntu noble main restricted unive=
rse=20
multiverse
 =C2=A0 =C2=A0 3: deb http://ftp.fau.de/ubuntu noble-updates main restrict=
ed=20
universe multiverse
 =C2=A0 =C2=A0 4: deb http://ftp.fau.de/ubuntu noble-backports main restri=
cted=20
universe multiverse
 =C2=A0 =C2=A0 5: deb http://security.ubuntu.com/ubuntu/ noble-security ma=
in=20
restricted universe multiverse
 =C2=A0 Active apt repos in: /etc/apt/sources.list.d/teamviewer.list
 =C2=A0 =C2=A0 1: deb [signed-by=3D/usr/share/keyrings/teamviewer-keyring.=
gpg]=20
https://linux.teamviewer.com/deb stable main
Info:
 =C2=A0 Memory: total: 4 GiB available: 3.66 GiB used: 2.55 GiB (69.7%)
 =C2=A0 Processes: 227 Power: uptime: 48m states: freeze,mem,disk suspend:=
 deep
 =C2=A0 =C2=A0 wakeups: 0 hibernate: platform Init: systemd v: 255 target:=
=20
graphical (5)
 =C2=A0 =C2=A0 default: graphical
 =C2=A0 Compilers: gcc: 13.3.0 Shell: Bash v: 5.2.21 running-in: mate-term=
inal
 =C2=A0 =C2=A0 inxi: 3.3.34


