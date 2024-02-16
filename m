Return-Path: <linux-input+bounces-1937-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C198857C1A
	for <lists+linux-input@lfdr.de>; Fri, 16 Feb 2024 12:51:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9AC5B225BE
	for <lists+linux-input@lfdr.de>; Fri, 16 Feb 2024 11:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D82878662;
	Fri, 16 Feb 2024 11:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AiIJUBbx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB7477F32;
	Fri, 16 Feb 2024 11:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708084312; cv=none; b=eN0vvnOoTVNEw3/WkwmQ+OCzAlwCkLGzTfpGAn3mWt0YEs4nokmzMW/huXiWGylhAvmtEU3cvDpqUiTr6Whs4kr4vUjFmTGyQegV4gb4u2xPREWvDrWWtqbGFE85CmXi0g0PiA+vZ0h/PRHAMncs9/X3HZKKKcqf90RYLQZtPEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708084312; c=relaxed/simple;
	bh=8c8z7IrXnQ8qHY9q5B6SwDk99cpEbxY5gPfy3wS60u0=;
	h=Message-ID:Date:MIME-Version:To:From:Cc:Subject:Content-Type; b=AhNXSwIzUiwwbpRnCIvZWKMuw7ZUnO9SuKeIOxg5c3dXLMOzET0Hw5oJ+RzXzefdFOwuFapbjzli6Pb+SsZHzln04nEaG1fJRzGaRFjqj5UGGDXCn6CNemi2j3jYprduDeMKC/eE/iiUtITAx+IbcM9jWykcKNcXt7Tt/ypGPPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AiIJUBbx; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51167e470f7so781889e87.2;
        Fri, 16 Feb 2024 03:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708084308; x=1708689108; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:cc:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Smi+XemBG3ZogtSdkPCilQ1a7PgwI71wggR8N7UK79I=;
        b=AiIJUBbxqMC7/tGkf9fgJHdJFmYbKEYT2Brm6vR/o2UDJYre03FoiBfD4ohRX91HHs
         Nc4xRCcGMxlB0CMre6JxWWIxAs513GDylWDWkqSoeCqhHRGDb+EOvTVYnaKr9D/XvIEQ
         1J1JYXnkVmwZJeiK9a5PMEt9FBnfR9KHTZC9LmxvAfz8eA08Rm9nNPkM6E6c2csDXU1X
         HbU6/5FQlBtheeebKbp/eR8H/qEMPBvj4cW8La+blrNhh1F4ByScTVTbhcrZP8UM5QYl
         lG24TwA2+WuNY9Bo4nekqPJdPm5d0DeAOPf5icEeZia/PNgwOIUxeVMQsrVA3SXMk6FG
         YdIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708084308; x=1708689108;
        h=content-transfer-encoding:autocrypt:subject:cc:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Smi+XemBG3ZogtSdkPCilQ1a7PgwI71wggR8N7UK79I=;
        b=qjrYZn6yQE5pB3x0/V/n6vpzWdc1ANLem4xJJZZLUYDh7Es6cz8AKuMMkmXiNvf7mb
         zM4iXMoTLzjJ0/yXRsh47BfSoEmxXHiU8dA4TXVoqTELnROx/+fK91u8YPsK+RMwPO2A
         PcFM+CSQe61gx+mM7SW+seMT8h96yXBtM9TWbwWFDmPiK0L8GX3f5wb8jqHpdBsWlfwP
         3+A/F7oJAPq515BSkbum8OoHtmdsbCR7OElnlfFrFZDb9HOiYtDmyzyk7UDygNS70kxD
         iZxONqEpWDFhlZCYOJU0Shi6tmx7d6yci2BzdeApouSVYucBtEo0Py2hfQpy/SA+16oI
         tmVg==
X-Forwarded-Encrypted: i=1; AJvYcCXM4Vz9cVXwPlClEdMGrpfy+sLrid+JBxebA0I1ydkbu3jl3dBJeQrQS7MqG2RCY86MBA/3bQ/IztBLA75s5VFO4MhsoIcEN9EutLc=
X-Gm-Message-State: AOJu0Yzv/xAfZ4OQyuQRiZFnT1d4/mvc5tuzqqvqUVEdcjKHoEaOQrUZ
	joNsEAcEiP8i/NkINLKR0icaiWQboHBLvfY5iaqFeq/1jTEZ4XNj/FPhWhueTB0=
X-Google-Smtp-Source: AGHT+IFMtn99C75IesMt3iYhbPCYI8c5GZvGp5FMz/36kPmrZYm+qVBychNQaYtOK+DT37/dO5wtAA==
X-Received: by 2002:ac2:59c1:0:b0:511:a088:faf4 with SMTP id x1-20020ac259c1000000b00511a088faf4mr3431515lfn.4.1708084307902;
        Fri, 16 Feb 2024 03:51:47 -0800 (PST)
Received: from ?IPV6:2a01:e34:ec5f:c111:cff2:caac:f1f6:c049? ([2a01:e34:ec5f:c111:cff2:caac:f1f6:c049])
        by smtp.gmail.com with ESMTPSA id n14-20020a05600c3b8e00b00410709fa0d3sm2130605wms.33.2024.02.16.03.51.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 03:51:47 -0800 (PST)
Message-ID: <a29d56d2-c440-4a26-a9ac-014595d2ae8c@gmail.com>
Date: Fri, 16 Feb 2024 12:51:46 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr-FR, en-US
To: Linux Stable Mailing List <stable@vger.kernel.org>
From: =?UTF-8?Q?Rapha=C3=ABl_Halimi?= <raphael.halimi@gmail.com>
Cc: Linux Regressions Mailing List <regressions@lists.linux.dev>,
 Linux Input Mailing List <linux-input@vger.kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@jikos.cz>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Mikhail Khvainitski <me@khvoinitsky.org>
Subject: Regression with Lenovo ThinkPad Compact USB Keyboard
Autocrypt: addr=raphael.halimi@gmail.com; keydata=
 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
 Wxcwwn0N
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear developers,

(sorry for the long CC list, it looks quite long to me, but I tried to 
follow the issue reporting guide as closely as possible)

Since patches [1], [2] and [3] were applied to the kernel, there is a 
regression with Lenovo ThinkPad Compact USB Keyboard (old model, not II).

[1] 
https://github.com/torvalds/linux/commit/46a0a2c96f0f47628190f122c2e3d879e590bcbe
[2] 
https://github.com/torvalds/linux/commit/2f2bd7cbd1d1548137b351040dc4e037d18cdfdc
[3] 
https://github.com/torvalds/linux/commit/43527a0094c10dfbf0d5a2e7979395a38de3ff65

The regression is that a middle click is performed when releasing middle 
button after wheel emulation.

The bug appears randomly, it can be after 5 minutes or 1 hour of 
keyboard usage, and can only be worked around by unplugging/re-plugging 
the keyboard. (I ended up resorting to simulate an unplug/replug, with a 
script which echoes 0 then 1 to /sys/bus/usb/devices/<id>/authorized, 
since I was afraid to damage the Micro-USB outlet by physically 
unplugging/re-plugging too much).

Those spurious clicks are very annoying, since they can open links in
new tabs when scrolling in Firefox, or pasting text when scrolling in
terminals, or other unwanted stuff.

I witnessed it with latest kernels (Debian unstable) as well as stable 
kernels (Debian 12 Bookworm, stable).

On Debian Stable, the last working kernel was 5.10.127, the regression 
appeared in 5.10.136 (i read all changelogs on kernel.org between those 
two releases but couldn't find anything about hid-lenovo, so I can't 
tell exactly in which release the regression appeared, Debian upgraded 
directly from .127 to .136).

I reported it in Debian [4], and apparently I'm not the only person 
suffering from it [5].

[4] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1058758#32
[5] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1058758#42

I would understand that such bugs would end up in a development kernel 
like the ones provided by Debian Unstable, but not with stable kernels 
like the ones provided by Debian Stable.

Regards,

-- 
Raphaël Halimi

