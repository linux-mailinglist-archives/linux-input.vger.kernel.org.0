Return-Path: <linux-input+bounces-11581-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F0FA82869
	for <lists+linux-input@lfdr.de>; Wed,  9 Apr 2025 16:46:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 953F34A2A83
	for <lists+linux-input@lfdr.de>; Wed,  9 Apr 2025 14:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E0833EA;
	Wed,  9 Apr 2025 14:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LXYsnlp0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1ABD143C5D
	for <linux-input@vger.kernel.org>; Wed,  9 Apr 2025 14:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744209725; cv=none; b=f5Y/su9iFC+PdMtx2BdVKlDa3+Z7L3BCKrKbgXMtsPJbd8q4fxh3jAuOo5jpDNawBcxpqJ8ZQdffKoo7X3bji9pCZqVmuD/hLDw3y5aMAMebQ9g51QxKLquwWrlOUz6yb2CaX9Scm9P4mpP3Yi1BTiBdSi+lpB5GMCQufQhmpNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744209725; c=relaxed/simple;
	bh=x4ZuBmGnMEJzNMxW7bG4YTJVFVzdoDIm4p6BmknUVkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=BXCbo5+B63EQnm7BgAbFufHQAL0gNPQLGsMHazcu3UF6zFRQ0jPNjno2PM3KyMkFzYeiUudNT73TlTcWSO0b2+zkS2WRZy6tk57teb4HBIpZ7h1aSAnnTpMjXUlqCLbRkzN5LS6XglMVMUGH5N0zluE/bnVIm+yhp4TOhUeRzl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LXYsnlp0; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso46413355e9.2
        for <linux-input@vger.kernel.org>; Wed, 09 Apr 2025 07:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744209722; x=1744814522; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0EH9J2Jn09GWrQkdTL8kONoEutlZGnTLLUCA5sDkT98=;
        b=LXYsnlp0NKxZgsNNFsdIy1AejsdX6TKmZWhl545v0KcNhf9RNKWX3BMV5ZIenm3aCK
         +Z8StqA7CdnEIw8pus7Zx/Xx74u19WkBFAcs6QYRDTu8bLJsLUakCDpHVCcQMHZ3mfu5
         wqN/+e4cMdYGJPgvtoArapOya0YKZwJ22ROJkhvh+CE9B1aJBZYQqRuMaEyc9d1VeIlk
         VY8sSkAsSQVSTpDVDB43ixqqlMQ3ExqOPCJbInVR5wlGdjLskkTZ7IgZGdsfrQ8fbb3Y
         x5m/YUfYxtkVyZPUblpKa9psKEFrYN3atO4QdnIuLM5wqZoWs3pAfDAUcYnpFzREfm9J
         tvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744209722; x=1744814522;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0EH9J2Jn09GWrQkdTL8kONoEutlZGnTLLUCA5sDkT98=;
        b=FG+pC8sF4HwzGAyLaJAV5UnZpLAfILh9YCPVqW5whFuGjmYjie0dMqxFuF2qc2A5A+
         O2N/Lqaoi/KbKsHr+ib2lND+ygZve040903wuaKEq8pJWApt6vMLfNod7r3f58M75HPg
         yuETvqAowcqRAQLuxISdm12O2bRlOEksmi/NW8z4MEY79mm/0LW231U1WXAOBoUQnTwF
         RbYAzxvh5AZidvUgLt9Zh/20EL8yQHZZnnHzQBlI7CtLiielgnzt0umAREVmBfbu/wYK
         kkNl7OB0dc7PJmnaFGwm7AUn0VtX5IZ+eyEJbtzcw+rNahPla0LDgXaWJNAVFGXVJ1Im
         z7sg==
X-Forwarded-Encrypted: i=1; AJvYcCWNHNf4pHrFk8yy8OCmNeILbkVtWyOIwWIGcPoW7f5LVP1m+KJPOStIsotQ/0HCTtmaB5D3HYa40eTmPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSHBqjURwOSs2qW469HHUkdQ9fL7iLKlIZ7WPBtNv65p0iUtsT
	RUZPd7SKj9aRZZOdXuHuQKya7PTEuPmCehY3haS7873MYquUoKwxAENB/b4UMvXGR9JMuRW94GN
	zVQEbgVRlaa4JwKzIN3zYJr3TXaWhUFluwwY=
X-Gm-Gg: ASbGncv8sS978cw6ovLCXvQJkT/oM8UptKGaXXfSMCqjWUsTp3cqmKt0PgWhbTRkdsN
	QAoMoQjNhnZywrBF5iiX7tW9Nw+B1zGzJOHJ4N0SVSAFD+F/cbL269W2ISGr3jvSPdzyKgnOhWc
	pN7zpyP7XxpLE+UMojrCTjAYQ=
X-Google-Smtp-Source: AGHT+IFIj4H/oAyqOqiJocJl8yqTaRUecF3PwPvcQKewtPAkHq0voHm+0vD9s9yztfzHX4IgM3/q0PJSH9T/FV2znOw=
X-Received: by 2002:a05:6000:1867:b0:397:5de8:6937 with SMTP id
 ffacd0b85a97d-39d87cdcb8cmr2742412f8f.41.1744209722004; Wed, 09 Apr 2025
 07:42:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAbCkm+hdmJ4ozW4viBkwp+7QQPgymA+bfb5ddOUCB=kaBvF9w@mail.gmail.com>
 <PN3PR01MB9597EA06B5B28C50A8CBBD3BB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <PN3PR01MB9597EA06B5B28C50A8CBBD3BB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
From: jt <enopatch@gmail.com>
Date: Wed, 9 Apr 2025 15:41:50 +0100
X-Gm-Features: ATxdqUH9mKpKLKBOU23rdc4-RsvTELP1za5itOAfKmI4X-IKYYho4NhgZFtLZIk
Message-ID: <CAAbCkm+v4EV2TgkfMSGjYNvy_HgXSYAm2cFYjjrA4tv+WqBREQ@mail.gmail.com>
Subject: Re: PROBLEM: Synaptics TouchStyk (trackpoint) on HP EliteBook 850 G1
 detected as "PS/2 Generic Mouse".
To: Aditya Garg <gargaditya08@live.com>, linux-input@vger.kernel.org, 
	dmitry.torokhov@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Apr 2025 at 12:36, Aditya Garg <gargaditya08@live.com> wrote:
> Is there a driver in the Linux kernel for your trackpad?

I think that the driver for both the touchpad and the trackpoint is
"psmouse". Here is the udevadm printout for the trackpoint node:


$ udevadm info -a /dev/input/event5
...
  looking at device '/devices/platform/i8042/serio2/input/input9/event5':
    KERNEL=="event5"
    SUBSYSTEM=="input"
    DRIVER==""
    ATTR{power/async}=="disabled"
    ATTR{power/control}=="auto"
    ATTR{power/runtime_active_kids}=="0"
    ATTR{power/runtime_active_time}=="0"
    ATTR{power/runtime_enabled}=="disabled"
    ATTR{power/runtime_status}=="unsupported"
    ATTR{power/runtime_suspended_time}=="0"
    ATTR{power/runtime_usage}=="0"

  looking at parent device '/devices/platform/i8042/serio2/input/input9':
    KERNELS=="input9"
    SUBSYSTEMS=="input"
    DRIVERS==""
    ATTRS{capabilities/abs}=="0"
    ATTRS{capabilities/ev}=="7"
    ATTRS{capabilities/ff}=="0"
    ATTRS{capabilities/key}=="70000 0 0 0 0"
    ATTRS{capabilities/led}=="0"
    ATTRS{capabilities/msc}=="0"
    ATTRS{capabilities/rel}=="3"
    ATTRS{capabilities/snd}=="0"
    ATTRS{capabilities/sw}=="0"
    ATTRS{id/bustype}=="0011"
    ATTRS{id/product}=="0001"
    ATTRS{id/vendor}=="0002"
    ATTRS{id/version}=="0000"
    ATTRS{inhibited}=="0"
    ATTRS{name}=="PS/2 Generic Mouse"
    ATTRS{phys}=="isa0060/serio2/input0"
    ATTRS{power/async}=="disabled"
    ATTRS{power/control}=="auto"
    ATTRS{power/runtime_active_kids}=="0"
    ATTRS{power/runtime_active_time}=="0"
    ATTRS{power/runtime_enabled}=="disabled"
    ATTRS{power/runtime_status}=="unsupported"
    ATTRS{power/runtime_suspended_time}=="0"
    ATTRS{power/runtime_usage}=="0"
    ATTRS{properties}=="1"
    ATTRS{uniq}==""

  looking at parent device '/devices/platform/i8042/serio2':
    KERNELS=="serio2"
    SUBSYSTEMS=="serio"
    DRIVERS=="psmouse"
    ATTRS{bind_mode}=="auto"
    ATTRS{description}=="i8042 AUX1 port"
    ATTRS{drvctl}=="(not readable)"
    ATTRS{firmware_id}=="PNP: SYN3003 SYN0100 SYN0002 PNP0f13"
    ATTRS{id/extra}=="00"
    ATTRS{id/id}=="00"
    ATTRS{id/proto}=="00"
    ATTRS{id/type}=="01"
    ATTRS{power/async}=="disabled"
    ATTRS{power/control}=="auto"
    ATTRS{power/runtime_active_kids}=="0"
    ATTRS{power/runtime_active_time}=="0"
    ATTRS{power/runtime_enabled}=="disabled"
    ATTRS{power/runtime_status}=="unsupported"
    ATTRS{power/runtime_suspended_time}=="0"
    ATTRS{power/runtime_usage}=="0"
    ATTRS{power/wakeup}=="disabled"
    ATTRS{power/wakeup_abort_count}==""
    ATTRS{power/wakeup_active}==""
    ATTRS{power/wakeup_active_count}==""
    ATTRS{power/wakeup_count}==""
    ATTRS{power/wakeup_expire_count}==""
    ATTRS{power/wakeup_last_time_ms}==""
    ATTRS{power/wakeup_max_time_ms}==""
    ATTRS{power/wakeup_total_time_ms}==""
    ATTRS{protocol}=="PS/2"
    ATTRS{rate}=="100"
    ATTRS{resetafter}=="5"
    ATTRS{resolution}=="200"
    ATTRS{resync_time}=="0"

  looking at parent device '/devices/platform/i8042':
    KERNELS=="i8042"
    SUBSYSTEMS=="platform"
    DRIVERS=="i8042"
    ATTRS{driver_override}=="(null)"
    ATTRS{power/async}=="disabled"
    ATTRS{power/control}=="auto"
    ATTRS{power/runtime_active_kids}=="0"
    ATTRS{power/runtime_active_time}=="0"
    ATTRS{power/runtime_enabled}=="disabled"
    ATTRS{power/runtime_status}=="unsupported"
    ATTRS{power/runtime_suspended_time}=="0"
    ATTRS{power/runtime_usage}=="0"

  looking at parent device '/devices/platform':
    KERNELS=="platform"
    SUBSYSTEMS==""
    DRIVERS==""
    ATTRS{power/async}=="disabled"
    ATTRS{power/control}=="auto"
    ATTRS{power/runtime_active_kids}=="0"
    ATTRS{power/runtime_active_time}=="0"
    ATTRS{power/runtime_enabled}=="disabled"
    ATTRS{power/runtime_status}=="unsupported"
    ATTRS{power/runtime_suspended_time}=="0"
    ATTRS{power/runtime_usage}=="0"


> You also have simply emailed the mailing list without sending a mail to the kernel maintainers. So how will they contact you?

I think that the relevant maintainer is Dmitry Torokhov so I will
include his email in the recipient list for future emails. (Thank you
for the nudge!)

(Copied from your next email...)
> Can you try adding psmouse.synaptics_intertouch=1 and i8042.nopnp to grub and restart?

As requested, I have tried adding the following module parameters to
the grub command line:

psmouse.synaptics_intertouch=1 # just psmouse
i8042.nopnp # just i8042
psmouse.synaptics_intertouch=1 i8042.nopnp # both psmouse and i8042

but each time, the results appear to be the same i.e. the device
continues to be recognised as "PS/2 Generic Mouse".

