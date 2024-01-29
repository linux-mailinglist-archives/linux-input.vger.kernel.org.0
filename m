Return-Path: <linux-input+bounces-1518-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A757983FBF9
	for <lists+linux-input@lfdr.de>; Mon, 29 Jan 2024 03:01:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EB722828DD
	for <lists+linux-input@lfdr.de>; Mon, 29 Jan 2024 02:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EEF5DF44;
	Mon, 29 Jan 2024 02:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NuxtfPpR"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12520DF46
	for <linux-input@vger.kernel.org>; Mon, 29 Jan 2024 02:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706493695; cv=none; b=HmyGFOlr6ciNNmSLUZNPq8ZO1OuUvjokTOD951nqm4NXsrEe+ALqUIONTfgxYe8KWHbKGCZB3AVJ+Y7Xcq1H8+8dB6ob2L4xV9wQaoEIKivZWiKUT7wcc5XHtNykKfIFKo5vYZlNn4Qao/G0crTv5qUjs4ggvYYuU6d/CjE31R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706493695; c=relaxed/simple;
	bh=jX+m0DjjfR/4Hju3PWjwKqwpOPGJamAxhxu2yqsWC+k=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=LSwYXcZhMVU/xBZtLniw5tRQAVjnWVJ8XZBKhamcLaQjwsKorRRi6/nKdQ3h+e8QhV6hVOldipihzKpivtow6jjm9nfM2UO2r4XmhOyq7LhcYxnxA8uITK5U1JXwS6hQnNjwFDVwFEznibNPkhv5TRuVgORjJB9WYOA0kcRxDQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NuxtfPpR; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dc372245aefso1529222276.2
        for <linux-input@vger.kernel.org>; Sun, 28 Jan 2024 18:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706493693; x=1707098493; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xB5IlM/nnZvn4v9nhPy0S7xCkBZ4+OE4bjsmn1Y7d1Q=;
        b=NuxtfPpRGht2dUCJat1jgEE8hBJOKwKh0TIZyxvqk4JyY5xS2UbEtFBuWjlae/oIxb
         cKW2VzLTWNbxl6mzQy8BVcEtMoLCxIKvlPhP4mLUS98ZUumZDWWLUhzistJKvfNIhB7r
         q5/gn3AkHKBeHLPtPl674eC9nJj0ElLyquiermQpt5hteNIxPRuoCAthKYyOMqDxLE2U
         NkYe7u/nwSa/7uDfaxgZ6fg0Sfk/oP5qkknKEnwloYsEp6+7nOtjJKk5aJoo6G6j0LtQ
         5LgDorPN2Id6rPwx+p4doiu4cXzYJ9/d7rFh8DWcxIvsjAOtQBZ06ciISkAWI/VtzXMj
         2qVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706493693; x=1707098493;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xB5IlM/nnZvn4v9nhPy0S7xCkBZ4+OE4bjsmn1Y7d1Q=;
        b=RILmpLJztfN/qytJ35hSdfZWxBuQywM5+Ninaat6WO4DlfXin+fae+mjVnZIgXq5gp
         YuWTXZhQZ5cRa9Iqr8NyvnBWq0sz8bmks/X3s4yu9JRFIDyRQ1l9T/Bstp/LE7+b7JbO
         Vp2WAR0s6FoA5C4saG9uNB14E7iX4EMP3OPoQ4dAuyuZhk8b9lF3yGXp+Wlx2GBBgsIH
         lrY9778qv/5kVKSKsFSe3hWBK3Bl4c8nof09s9FGWEKVjPAyXiGwdsZ10c23Fvl0tpR4
         tO6hxpYl7vF9EvBr2g20AgLEysUnPsbvlLLu6jCBGQGfFJ+4CsXGopFV0jt7aPp7Fghq
         mvTA==
X-Gm-Message-State: AOJu0YzrNNuMJs2Wj2x5FXIM1nRctnkclK7rWO9M1JsIlMz6MM79XkiO
	Jd48BKpjikjIsw50pSbrmQVwgRvslrKZY//7GJ8DWowzuZWjsDQRUYg8dxOvE4W+GwDzYhyq3fv
	wLxMvPXTTDpCA358FbD6OyzUwawZ26K1Jrk0=
X-Google-Smtp-Source: AGHT+IFvcafE49NxVQf+W52CBgDUWJq/hGoLPRVMWKTpyRdgO08x5Zj2zffaiSAS3lofmRvJYhQs4BWmgQHEqE/g02g=
X-Received: by 2002:a5b:907:0:b0:dc6:18a9:5518 with SMTP id
 a7-20020a5b0907000000b00dc618a95518mr1306011ybq.122.1706493692811; Sun, 28
 Jan 2024 18:01:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Xavier Distelzweig <x.distelzweig@gmail.com>
Date: Sun, 28 Jan 2024 20:01:22 -0600
Message-ID: <CAG-SpM=n+dki3Toz=zbi44Fj6S3dwzuo3d1UBnDUCkP8Af40LA@mail.gmail.com>
Subject: psmouse touchpad bus support on kernel 6.5.0
To: linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

psmouse informed me that my touchpad could support a different bus, to
try setting psmouse.synaptics_intertouch to 1, and to email you. I'm
not sure what system information you would want, but here's neofetch:
          `.:/ossyyyysso/:.               xavier@khalat-ir
       .:oyyyyyyyyyyyyyyyyyyo:`           ----------------
     -oyyyyyyyodMMyyyyyyyysyyyyo-         OS: Kubuntu 22.04.3 LTS x86_64
   -syyyyyyyyyydMMyoyyyydmMMyyyyys-       Host: HP Elite Dragonfly
  oyyysdMysyyyydMMMMMMMMMMMMMyyyyyyyo     Kernel: 6.5.0-15-generic
`oyyyydMMMMysyysoooooodMMMMyyyyyyyyyo`    Uptime: 4 mins
oyyyyyydMMMMyyyyyyyyyyyysdMMysssssyyyo    Packages: 2498 (dpkg), 13 (snap)
-yyyyyyyydMysyyyyyyyyyyyyyysdMMMMMysyyy-   Shell: bash 5.1.16
oyyyysoodMyyyyyyyyyyyyyyyyyyydMMMMysyyyo   Resolution: 1920x1080
yyysdMMMMMyyyyyyyyyyyyyyyyyyysosyyyyyyyy   DE: Plasma 5.27.10
yyysdMMMMMyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy   WM: kwin
oyyyyysosdyyyyyyyyyyyyyyyyyyydMMMMysyyyo   Theme: [Plasma], Breeze [GTK2/3]
-yyyyyyyydMysyyyyyyyyyyyyyysdMMMMMysyyy-   Icons: [Plasma],
breeze-dark [GTK2/3]
oyyyyyydMMMysyyyyyyyyyyysdMMyoyyyoyyyo    Terminal: yakuake
`oyyyydMMMysyyyoooooodMMMMyoyyyyyyyyo     CPU: Intel i5-8265U (8) @ 3.900GHz
  oyyysyyoyyyysdMMMMMMMMMMMyyyyyyyyo      GPU: Intel WhiskeyLake-U GT2
[UHD Graphics 620]
   -syyyyyyyyydMMMysyyydMMMysyyyys-       Memory: 2239MiB / 15328MiB
     -oyyyyyyydMMyyyyyyysosyyyyo-
       ./oyyyyyyyyyyyyyyyyyyo/.
          `.:/oosyyyysso/:.`


Here's a link to my /var/log/syslog (on google drive):
https://drive.google.com/file/d/1vUGHHlfBgSJQQ1dcNBGxj0asZzMp8vPl/view?usp=drive_link
Today was the second time (since getting this computer and installing
Kubuntu) that my keyboard/touchpad assembly appeared not to work at
all, even after a reboot. (both this time and last, it started working
again, I know not why. That's how I'm typing this email.) Are these
connected in any way?

Thank you so much for your work,

Xavier Distelzweig
Xavier

