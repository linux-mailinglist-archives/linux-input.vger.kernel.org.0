Return-Path: <linux-input+bounces-17165-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E6FD38EC8
	for <lists+linux-input@lfdr.de>; Sat, 17 Jan 2026 14:44:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1EDD530051AC
	for <lists+linux-input@lfdr.de>; Sat, 17 Jan 2026 13:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A03371DE3AD;
	Sat, 17 Jan 2026 13:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/A0yYou"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE8F302146
	for <linux-input@vger.kernel.org>; Sat, 17 Jan 2026 13:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768657467; cv=none; b=f+lIB9QgzmvivGfCuiU19/kyS21dIXVMNIx6xwzDK5UpqnTf+wryKXLjLH0V0miaT0sHJjLyzO8hNrs8UtX0S0T1OgtrWhRl4o6UQ9VVRXC7cgUY7ji0dxmv0QHxbkssjCm3Cc95JhihlTFQs9KP9iv5aL8E6AOW+YffqbIIs/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768657467; c=relaxed/simple;
	bh=16xkLEEwwQYgxLExtGmskLce9R86bYPg/oyEY9iu638=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PRg1yIaMuWNTHg6lJ/A6FRCqyGl7ngENShf3ko6gMD26cGisAiiVqnjF03UUI8L9mFJtZFs0RpUa9ZcLTqkTC31IEpUiIuwxgfo0cOmKgIy4fK4FA6II+iDnXXT4ag4RQRRYp97TG/gBk12hvbhtMR8l58Z8sALL6tzxb1EYZL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/A0yYou; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12332910300so2333432c88.0
        for <linux-input@vger.kernel.org>; Sat, 17 Jan 2026 05:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768657457; x=1769262257; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=16xkLEEwwQYgxLExtGmskLce9R86bYPg/oyEY9iu638=;
        b=k/A0yYoulFQniv9NhfmVvTYX7D7JHLnDGR62C35g8ASfGT6XQFDlWffyp41cqayJFB
         bDEPwRKRX+cdggTt3Zs68+SpEgTW+3gAWfYQPb26vqpKoigw7MQwcboOz5J+W4HUvuA2
         SQIf4giNj7NsxP5k3vLTQGQmUn3dN5Bgy++tQJvm52BhRlaXGIfei/ohGnRWNV4A2rBi
         Vjpx5VHva/VzL5yDJa0kaWds/DRvBMhyIa+5u3LoxlDikDy2iscizAWEP+U3Ab756H8W
         fxdLc8amxjMHHX0qmA/tS1jKOq1afkqZIUEvr0GI5gKbn6LWqKGkw6DP0aCHrYLaCIP/
         qsow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768657457; x=1769262257;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=16xkLEEwwQYgxLExtGmskLce9R86bYPg/oyEY9iu638=;
        b=u2Ppp2BILNOV1QrjxaDAOHD39b+xwOzNROAAsV6AhYqdbIrI8LQ9fBfSVOsO1+S3dY
         qx3eUC69RZjfTZ1MpQMG5ga0BCxf4Nphb9vGWOv0u5mC+FwsdpfHDle77Wv1Kdb0+SFB
         EO4xTOqR0EG28wQkh+1alvf6PJC+dxQB+K+4PQ4lYF/5A4/+3c+Irl4bwE27LfmKd/z2
         zJC5R5KtIlTwf7xcWeQ746yovQaPI/w+arqm1I8S0KtL67FmfA4xlU04n5uvBfVPHc5Q
         b8WVWLC0hFcG/CqZRa8T2nKE/0Mc94Ap3Zsr+JCpsuKZSnoKxszxviiAUWdIEitfXtJl
         b4rQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBD1N6VqKzwyzY/oc4W1Y4TLWUE1h9nHcs7UiucKZ2bTIgI1m6gLp+V0ipDlgh7ffGO4crjEbdu296Ng==@vger.kernel.org
X-Gm-Message-State: AOJu0YznO0YmHZEc9EC23HToqCIXlzmEjQRt2ddfICNxstdAlxb5tBzb
	pTkYqbQew08H42JtBsh7FKlhg0kIZnyZo1RpeBx37HrQZr60MXHXs2iAWK4+gs9B+XQMxR3Z+VG
	8aDtn25HX9a+/duuW2LNu8Er6eCNrR9tMrbVkW8Y=
X-Gm-Gg: AY/fxX6oy7oWIATaWOSCLqbf+SsUmoUYMW4WWN5K9LwJH0YmYrlY0ICsx2wkuCixEjy
	tFa+4fy7J3E/vGbXqERwckyWg+KdHH42Ld3vpiTd3OO8cG2wIJZ5ibXIZFZ8HR9i/ByOgbK1ftC
	mpt8YQwDTrLb4dzEzHIQrdhsFJhTuvdholMd1zKiUMcSH24MxTpEOflHujpjNYAwFp6YqEyigGi
	Ja+pA1HEA5ydieVocOwAWhIFcJ5VyPUR8agjAi48/leMW3zKT30E+yddgPct83+iqFjySxd1G12
	8o2haiewbk1Wr1q+fbLtx/sV5LY3Dl1eV1ZnaHI=
X-Received: by 2002:a05:7022:1601:b0:119:e569:fb96 with SMTP id
 a92af1059eb24-1244a6fa368mr5353876c88.5.1768657456915; Sat, 17 Jan 2026
 05:44:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOQ1CL4+DP1TuLAGNsz5GdFBTHvnTg=5q=Dr2Z1OQc6RXydSYA@mail.gmail.com>
 <38ea07c1-50ce-4342-aba9-fe2f4bc6c503@bitmath.se>
In-Reply-To: <38ea07c1-50ce-4342-aba9-fe2f4bc6c503@bitmath.se>
From: Liam Mitchell <mitchell.liam@gmail.com>
Date: Sat, 17 Jan 2026 14:44:05 +0100
X-Gm-Features: AZwV_Qh3PjsEE5tAFiSjFvbW0ULAn2kCZAhONDDysUBWe032bY5dMUpdUxWWEBI
Message-ID: <CAOQ1CL6G6eDcX+Qth3D531h72wW3RmvecCWjr5nAT-UdDWg40w@mail.gmail.com>
Subject: Re: bcm5974 trackpad broken after USB reset
To: Henrik Rydberg <rydberg@bitmath.se>
Cc: Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 11 Jan 2026 at 20:59, Henrik Rydberg <rydberg@bitmath.se> wrote:
> I would look into the code around the wellspring mode switch function,
> and see if it gets called after the usb reset. If not, adding the
> reset_resume handler might resolve things.

Thanks for the pointer. The wellspring mode switch is definitely
attempted. The bcm5974 driver does the mode switching in input_dev
open/close hooks. These are called multiple times after reset. See the
following logs produced after `sudo usbreset 05ac:0259`.

[ 2650.749585] usbcore: bcm5974 2-1.8.2:1.2: forced unbind
[ 2650.751511] bcm5974 2-1.8.2:1.2: trackpad urb shutting down: -2
[ 2650.752285] bcm5974: switched to normal mode.
[ 2650.776877] usbcore: usb 2-1.8-port2: not reset yet, waiting 10ms
[ 2650.838722] usb 2-1.8.2: reset full-speed USB device number 5 using ehci-pci
[ 2650.850861] usbcore: usb 2-1.8-port2: not reset yet, waiting 10ms
[ 2650.933792] usbcore: usbhid 2-1.8.2:1.2: usb_probe_interface
[ 2650.933808] usbcore: usbhid 2-1.8.2:1.2: usb_probe_interface - got id
[ 2650.933816] usbhid: drivers/hid/usbhid/hid-core.c: HID probe called
for ifnum 2
[ 2650.933856] hid: drivers/hid/hid-quirks.c: Found squirk 0x84000 for
HID device 0x05ac:0x0259
[ 2650.934811] usbcore: bcm5974 2-1.8.2:1.2: usb_probe_interface
[ 2650.934836] usbcore: bcm5974 2-1.8.2:1.2: usb_probe_interface - got id
[ 2650.935368] input: bcm5974 as
/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.8/2-1.8.2/2-1.8.2:1.2/input/input28
[ 2650.959530] bcm5974: switched to wellspring mode.
[ 2650.967511] bcm5974 2-1.8.2:1.2: trackpad urb shutting down: -2
[ 2650.968274] bcm5974: switched to normal mode.
[ 2650.974204] bcm5974: switched to wellspring mode.
[ 2650.981548] bcm5974 2-1.8.2:1.2: trackpad urb shutting down: -2
[ 2650.982406] bcm5974: switched to normal mode.
[ 2651.001294] bcm5974: switched to wellspring mode.
[ 2651.005533] bcm5974 2-1.8.2:1.2: trackpad urb shutting down: -2
[ 2651.006286] bcm5974: switched to normal mode.
[ 2651.016678] bcm5974: switched to wellspring mode.
[ 2651.023558] bcm5974 2-1.8.2:1.2: trackpad urb shutting down: -2
[ 2651.024432] bcm5974: switched to normal mode.
[ 2651.033633] bcm5974: switched to wellspring mode.
[ 2651.325355] bcm5974: bad trackpad package, length: 8
[ 2651.333339] bcm5974: bad trackpad package, length: 8
[ 2651.341311] bcm5974: bad trackpad package, length: 8

Adding a delay in bcm5974_probe() didn't seem to affect the multiple
open/close/modeswitch logs but it did end up in the correct state.

Liam

