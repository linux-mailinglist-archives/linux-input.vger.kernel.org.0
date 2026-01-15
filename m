Return-Path: <linux-input+bounces-17113-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EC8D25447
	for <lists+linux-input@lfdr.de>; Thu, 15 Jan 2026 16:21:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54CBC303F366
	for <lists+linux-input@lfdr.de>; Thu, 15 Jan 2026 15:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC7C3B8BBA;
	Thu, 15 Jan 2026 15:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cOsDO23H"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698CB3ACEE1
	for <linux-input@vger.kernel.org>; Thu, 15 Jan 2026 15:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768490454; cv=pass; b=uCZGpEZUaDTZBz4YqlB21eRjaTOIpdhphYTaohLHURtXWyABpHZRMzwkJHziEyXvzOg7VRQdVBhceWR7Xpk+s5i4Ir2x/9vNPbRXUItWxuWg2BkIcYUc7ytgeAhwlo4bLjc3fc1onbkFS9/Xwn9ktQhIIBJQ4BLZxDa9xpO125w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768490454; c=relaxed/simple;
	bh=lNikTZ3BxavtyfJhq3N11bP2b9G72R/J1S+BsI+nxQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=euHC1v2VXNamHbfwWIz8ipHiwoklOMP6lPd6PSvOXKoKY1aUtfZjFN4irIohBIsGIk7gh9xHLnrPL9CYQI1V422caOEgwPMPFsIe/mnm9icOpe1Vf3Hp1AZ2psANIOkG0i858DMAatahgSZzG+WUi31SjsQsvXY7FlfSjxiuoMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cOsDO23H; arc=pass smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8c5320536bfso119011485a.1
        for <linux-input@vger.kernel.org>; Thu, 15 Jan 2026 07:20:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768490447; cv=none;
        d=google.com; s=arc-20240605;
        b=at0A7QCNi8OS8ig7J+R78WrmTyo4XNOgOD4n8B02S1DCDRIC1eaKd+OQIyd8abiFdj
         8sJg9bHsdPzMtT++DKl5y3JHg9rBvvWTPJw962RyTwjVN5kTeW8v1HHIwNdH24k7UrCf
         QIcargqE1xiqrhXLE0taRZfQLYos80Xj8KZp1aDXQs2zWxojqgoPzMJQ3mtLckrAUQis
         FxiUoH0Y1TSHTLyZBye4ydTcXhlJjo8lMRSuqFuBVt8v1NGLe/OXNWS3D6oR5AtvzG3B
         aPU6KgF+r6nRnzUy5+d1vwRW95IUwGYBOviGfcaBhZ1kQAg6fzOmR1akYsdurNJta0qQ
         jwUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7B/vsCWwAkWcRuiQXAhP9M2VDJoAuG+JhlvABQd+7LM=;
        fh=TWKLkn8QnZVAt6JzgC2K2v9Kk8hOTMc0ROIpKxQfygU=;
        b=J1kuUilc15xY3t0ytGYqfu352t9GFmEhSny7yu6NQxmk4hAo1DKHOOeEy0FO0RUoGK
         z6OVr8tDkyHzum+EXBRCesgun128WhJrhAOrhezx4g/Bko4P6wusuerf3qV8+bOpE3iB
         Tf+OwbBk1104yDy/Nnrd/VR5QyqJkI6GoH3UvRBInsnyGsDKBkxNa4jJ/wncXc4PyABQ
         zpLA+Jt5jaRZ+x9vAa+GjgLNaFM+KFUGD3rBMm2is9BpcefK2L61B4f5YbeK13oGw+EW
         OeT8pIeLN7qhp/bjfuciYPy2ntdA8ojTFwScKzySzBcM4BJcJ++IGSBPDJcpkQOiwm9z
         tp+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768490447; x=1769095247; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7B/vsCWwAkWcRuiQXAhP9M2VDJoAuG+JhlvABQd+7LM=;
        b=cOsDO23H73CPCelOoOT3cT2/Hl8Ll8a+LLwm6zsYH50fmVAznFVDYygBku7eEXUzWk
         Ua6I7HowRm/Dm6+VUEq8Uxv55MAe8gH1ShpDG8JOqZ9+1MvWqbwzFZNflt383dipor1H
         IU1jnPhv+51GhUyUryKMPELThsRYBg3bpZ7fKm1n9bxiCEqbL4Uvzd3UPdZgONs9h5k5
         LeFOy3WbKmOBJJayycQoM58VdwewHT8o8f0aW6QeSuuytV0d4cJtd4viPmK9/rNWm9e2
         CofsOPW83h9REeJ/3E2mqU1Q/Zbs0b5eXfyP8uoT+aDo0GdhMkikkPZVP83Cw2+aI2Pd
         i7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768490447; x=1769095247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7B/vsCWwAkWcRuiQXAhP9M2VDJoAuG+JhlvABQd+7LM=;
        b=cZj6YnbLZnYKOKLZbQI8arkoUi7EYajTW9Z7B7fnSjZtmMaBmbJRgGtf9YfWL7OaTj
         lHcS5hrjfHmjGe5/RVJuilK1RgUiNk6ZV/r+dhKct0uYFuJRHgxa3t6gQpb0ZVtcop5I
         Wu1bUG7d0W+VOGkVgaWJfXn/iHxJ/FjXzIXfxxR7RIY8UfpaeVRr/1dUtKkX9xIj5Jv7
         5++S8dahC9pv/f0/9B39zJ4yEytQAGFLxUv22kColdljUYeWRLBnH01NogthBPkw5hbl
         IvjtYlejDIZ/nMVjcwFR4TWEr7kp5d2+hi/zFgSswsmrGZbxuRD0CiF370gxEuBTiWjP
         NLKA==
X-Forwarded-Encrypted: i=1; AJvYcCXLW2GJXq2O6QIXntcg4+eQu1vB2jW+BihNJvVvOPzGUxn80CBgYuMlWUo9gbYxhdFb++h+5M+usLXhTA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy26IF/AUkhvV24Rvs4XCht9sYxoOWAqwK3ZcQ25wtFPB8NHtBO
	jkisbqGqLgepxEF1WLJzjqhUOn8jK9gZjBJGFaOsQ1VVpRar57OVNjdJjuf7uCG8NM3V+HVTa64
	6g5+RhIzdzas9PI2c9UV5XGH1xkgK3g==
X-Gm-Gg: AY/fxX76tg4jAGI7CyR79OB+NIVtHfBoIO5eq4xRoP7zpYFdaS34A/z+8+3NZ4lLELg
	bugLkSiaLY30Efy4KU4iBRiyMjTE4X8psr2jlJbZeYxdAn2JQ8Dra6wHmtjSKDOqEXKCEDDw6/L
	VnZ9A8XrP5Ms/YK1OTUoLD4aT//zG43Rz0yI7qszuYC9nm0saR1q4BPcLFKCZKCCRXinFnr+AvI
	9PQzzNyEdjzn7h+JZUriSJWldQFsvSzRsNcO9utvXrFVnkEmVIWy3yeoB+eDMYcRTXWFNFbG+VC
	lQHa9A==
X-Received: by 2002:ac8:7d44:0:b0:4e7:2dac:95b7 with SMTP id
 d75a77b69052e-5014823d4a6mr92765551cf.37.1768490447211; Thu, 15 Jan 2026
 07:20:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115142417.243-1-qikeyu2017@gmail.com>
In-Reply-To: <20260115142417.243-1-qikeyu2017@gmail.com>
From: =?UTF-8?B?6b2Q5p+v5a6H?= <qikeyu2017@gmail.com>
Date: Thu, 15 Jan 2026 23:20:35 +0800
X-Gm-Features: AZwV_QiJQKrSJYbP7utIv9DgYjJlKKEKJgwByBZo1nuoIwum3JR2S5alXnbZ4DA
Message-ID: <CALEuBakV4Uz3xyy8gbYFv8Tg+uA3hMCE+5Qrs8KH2EQw4T9Tsg@mail.gmail.com>
Subject: Re: [PATCH] HID: logitech-hidpp: fix NULL pointer dereference in hidpp_get_report_length()
To: jikos@kernel.org, bentiss@kernel.org
Cc: Bastien Nocera <hadess@hadess.net>, lains@riseup.net, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, hansg@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Thanks for the feedback.

Best regards

Kery

Kery Qi <qikeyu2017@gmail.com> =E4=BA=8E2026=E5=B9=B41=E6=9C=8815=E6=97=A5=
=E5=91=A8=E5=9B=9B 22:24=E5=86=99=E9=81=93=EF=BC=9A
>
> Add validation for report->maxfield and report->field[0] before
> dereferencing to prevent NULL pointer dereference.
>
> The HID report descriptor is provided by the USB device firmware via
> USB control transfer (GET_DESCRIPTOR). A malicious device can craft
> a descriptor that defines an OUTPUT report without any usages
> (padding fields). When the HID subsystem parses such a descriptor:
>
> 1. hid_add_field() calls hid_register_report() to create the report
>    object and stores it in report_id_hash[id]
> 2. Since parser->local.usage_index is 0, hid_add_field() returns early
>    without calling hid_register_field() to add any fields
> 3. Result: report exists with maxfield=3D0 and field[0]=3DNULL
>
> When hidpp_probe() is called for a device matching this driver:
>   - hidpp_validate_device() calls hidpp_get_report_length()
>   - hidpp_get_report_length() retrieves the report from hash (not NULL)
>   - It then dereferences report->field[0]->report_count
>   - Since field[0] is NULL, this triggers a kernel NULL pointer
>     dereference
>
> Data flow from attacker to crash:
>   Malicious USB Device
>        |
>        v (USB GET_DESCRIPTOR control transfer)
>   hid_get_class_descriptor() -- reads HID report descriptor from device
>        |
>        v
>   hid_parse_report() -- stores descriptor in hid->dev_rdesc
>        |
>        v
>   hid_open_report() -> hid_add_field()
>        |                    |
>        |                    v
>        |              hid_register_report() -- creates report, maxfield=
=3D0
>        |                    |
>        |                    v
>        |              returns early if usage_index=3D=3D0, no field added
>        |
>        v
>   hidpp_validate_device() -> hidpp_get_report_length()
>        |
>        v
>   report->field[0]->report_count -- NULL pointer dereference!
>
> This is triggerable by an attacker with physical access using a
> malicious USB device (e.g., BadUSB, programmable USB development
> boards).
>
> Fixes: d71b18f7c7999 ("HID: logitech-hidpp: do not hardcode very long rep=
ort length")
> Signed-off-by: Kery Qi <qikeyu2017@gmail.com>
> ---
>  drivers/hid/hid-logitech-hidpp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-=
hidpp.c
> index d5011a5d0890..02ddbd658e89 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -4314,7 +4314,7 @@ static int hidpp_get_report_length(struct hid_devic=
e *hdev, int id)
>
>         re =3D &(hdev->report_enum[HID_OUTPUT_REPORT]);
>         report =3D re->report_id_hash[id];
> -       if (!report)
> +       if (!report || report->maxfield < 1 || !report->field[0])
>                 return 0;
>
>         return report->field[0]->report_count + 1;
> --
> 2.34.1
>

