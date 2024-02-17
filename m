Return-Path: <linux-input+bounces-1946-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36176858E59
	for <lists+linux-input@lfdr.de>; Sat, 17 Feb 2024 10:38:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 92F89B2111C
	for <lists+linux-input@lfdr.de>; Sat, 17 Feb 2024 09:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54DD81D526;
	Sat, 17 Feb 2024 09:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UDhkY3GJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090BD1CFBE
	for <linux-input@vger.kernel.org>; Sat, 17 Feb 2024 09:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708162703; cv=none; b=VIJAlhCikRvMYPm3TNwaW4SrlhZ19AgvcO48/WEgxrpQN4xiVIUMtjplhURkWcv9m6DdHxEs3bzb1RJHvtOA+dPMPs5Cf1DF8SLHYyKgtBHjmAQ1TK1JM4F6gw6BAIcbxgTdH1KywKbcjENYLXqMaP3xaybJMKKwYYpT3J0jGsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708162703; c=relaxed/simple;
	bh=LAg7IPX/LFccnoiONHR/Ru8s5LFl/bUAFzSWZJPyMx0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Mlxh9fSDj9XmGkryC3RzUJX06NbpmjnUrw2gDx0z1CO2/jwCjxe0skaaq858eEhOgGLx4/gGCAckDI33+z26/zvPCulkNPD66YkHrtU0UjAX7D5Zmhno6n8BVDmr4rMv0a/dr/UcmwPUbXDVoXaxyd/T007AZujwVBdD1Fj6Ot0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UDhkY3GJ; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6860ff3951aso13357796d6.1
        for <linux-input@vger.kernel.org>; Sat, 17 Feb 2024 01:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708162697; x=1708767497; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LAg7IPX/LFccnoiONHR/Ru8s5LFl/bUAFzSWZJPyMx0=;
        b=UDhkY3GJYKNxX0Rn+HhjtaMN86wmS+QZ4mBNCA+pHlrav37whkUK2pxycIZy+7d2mt
         SOMe8esGSIuXK3iqcpV9vQ8Z3/2qPkjfbrgDyP2Jlo46miXgz1CBo6UKDPobWvRSfHw6
         NYEUKUCgoUDJDfP0mJKqEEc2ubflque3otj4RIsfp/aodhS4ds8NFlvfLyYHIvf4hW8z
         pmF5654Pkuw8thcRurqzYjf8EaOZWYi8VfoXDWvHzgCz+zQ1pyOPPaoegnNKehlFeBAu
         ksNDn/7hEiS9Wc9aYiX2qQLRntFCYLcMjBtlYTBAFJITljM3blUmCzsN84VTUxfe+MkX
         yinw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708162697; x=1708767497;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LAg7IPX/LFccnoiONHR/Ru8s5LFl/bUAFzSWZJPyMx0=;
        b=NfiZofIFjpzxAbMZSvInS1oUVOK97sqZcSerfrtNRnJ2P2zPFOGonp/lgHpxf3q3G2
         SArr1FgoUZVvPjO+VGZg/XJTnPImkhVd1fPo0auf45xPzokfaPwGrpq5AJSnUUPIXvUB
         LGk2h0SGZ3zlyMRx7cVRyjVwpumvERfIkUU7SbFea9wL+XmDn4q/aL/GG5Ixx5NZkvvD
         XDzZ1jpD3rpmz95H/Ne9tuWZomTuM9XshxrolwNFmswc6LjYqo+ZCJ11S00UxjsjOCDT
         FQH62soD41dv3a+hQM8VEzGFBKaDPKPl4617xGdzIsRM6/Pne/ZFc4bGkxY+cmGSlh/I
         9QRQ==
X-Gm-Message-State: AOJu0Yy1gN3vIwnJ9UQ/FcnxwFwefZ1h42ECzjjMRwE0DbMLkTamgLGM
	YQk6awC3+0gsBburi7SDSZngcvL7JAloBJPbdG1Yxea95TzkWjPXDzlAb7obs7+lAnEoQbNmXDt
	LzeuttxYwFBAA4jXZ0B0VFEJOLhu5DjDPl3YRsQpz
X-Google-Smtp-Source: AGHT+IEWk5o19oRT/HZ17+DA63Zqpq+XzalQssQXJkqukSx6DZfv+tkk+Le4S26nPKmUbBXd55X3czdlYi9LOnA/Oy4=
X-Received: by 2002:a05:6214:21ec:b0:68f:160c:fd8a with SMTP id
 p12-20020a05621421ec00b0068f160cfd8amr7716620qvj.0.1708162696781; Sat, 17 Feb
 2024 01:38:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rodrigo Aguilera <rodrigoaguileraparraga@gmail.com>
Date: Sat, 17 Feb 2024 10:38:06 +0100
Message-ID: <CACSVgagaEHO2zoYQ8zDBrMT9OvT8R5B_h3dxfZuLQFAUBtKMmQ@mail.gmail.com>
Subject: Fnlock for Lenovo TrackPoint Keyboard II in USB mode
To: linux-input@vger.kernel.org
Cc: jkosina@suse.cz, flokli@flokli.de, ValdikSS <iam@valdikss.org.ru>, 
	benjamin.tissoires@redhat.com
Content-Type: text/plain; charset="UTF-8"

First time for me posting in a kernel mailing list, I was kindly
instructed by ValdikSS on how to do so.

I have a TrackPoint Keyboard II that was working for me normally in
the 5.18 kernel (debian). Then I updated directly to kernel 6.5 and I
started having problems with the middle click pasting text when
scrolling and the fnlock button not changing the F1-12 functions nor
changing the led. I updated to 6.6.8 and the middle click problem is
gone but since the 6.5 update I also lost the ability to change fnlock
with fn+esc. Do you experience the same?

What I currently do is change between android and windows mode on the
keyboard physical switch. Those have different fnlock initial default
state. windows mode locks F1-F12 keys and android locks media keys
like volume up/down. Before the update everything worked fine.

I also found discussions regarding a patched firmware
https://lore.kernel.org/all/?q=trackpoint

So maybe it is not related.

I tried to force pre-5.19 behaviour by using `modprobe -r hid-lenovo`
as ValdikSS suggested but that doesn't recover the fnlock
functionality and I lose scrolling with the trackpoint.

I will summarize the quirks of each mode:

* USB wireless connection and switch in android mode (what I currently use)

-- Fnlock stays locked with the multimedia functions. Esc key led off.

-- Fn has no effect so I can't input F1-F12. That is maybe the reason
why fn+esc doesn't change fnlock

* USB wireless connection and switch in windows mode

-- Fnlock led is on so F1-F12 work and can't be changed

-- Fn + F1-F12 executes multimedia functions

I don't use this mode because I use the multimedia more than F1-F12
but I switch to it manually when some program needs the keys

* Bluetooth connection in windows mode

-- Fnlock can be changed with fn+esc

-- Key combinations like shift+volumeUP don't work while they do in
the USB connection

-- I can't use the keyboard until the bluetooth is up so I have to
input my full disk encryption password with another keyboard or switch
to USB mode.

* Bluetooth connection in windows mode

-- Same as previous mode but fnlock can't be changed


Is there a workaround for any of the issues?

Thanks

