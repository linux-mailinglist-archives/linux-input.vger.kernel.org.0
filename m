Return-Path: <linux-input+bounces-5189-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1468493F6D0
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2024 15:37:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F9EE281351
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2024 13:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90891148FF9;
	Mon, 29 Jul 2024 13:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gtCX0AXO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A740147C86
	for <linux-input@vger.kernel.org>; Mon, 29 Jul 2024 13:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722260243; cv=none; b=h6msjaZuA0I7xv2FRzKiDGnZ6TDjX69dc/foG+lmECNXTmNQXVj7+LP+ZBGH+4vA1X+ylENO7L+Q86xrfCPhqZNcFmJoE54GfdHCw9ePsWk/lSTrld65wvl32ufEzGS1L+GXjm8s88rFlSiZMxWa/OIUFNqrqKhgjqt7ks7i1SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722260243; c=relaxed/simple;
	bh=TdarGSv19dLebhrk2LtQfRDEJjNlAi0LNP/ghMVcJ58=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=pH56ZvlGq1M7qS/bbkUM2fry730EyOfuPZgMbryS6rsKmsUA3IzrUFBVUgPqbU+o4EYw7+W6wx4id4XbOGAc15Oitiq/36B13sv8l/ozzGq9RxnY1y1y84JVa2ngbg6Umbe/Qz6KDQjhj2UIwCUseDjo6/r2RNJ/mOWACBJxTNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gtCX0AXO; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-70ede9df528so910806b3a.2
        for <linux-input@vger.kernel.org>; Mon, 29 Jul 2024 06:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722260241; x=1722865041; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TdarGSv19dLebhrk2LtQfRDEJjNlAi0LNP/ghMVcJ58=;
        b=gtCX0AXODe2zduUcu3xUva2Mi4W96aS1ApSqK/fLF4LV/K6nstogJcGaBlCpMhnDB0
         sFoznDejJDfsSF/wP4NF4UCBn+2mAeFrR9tUVW87Ifw34wOVB8PrrzhK/MSNedL61RbX
         /LtPhDDQibRq4jEJh7UG0ernQON3M1SXGf0no82EBLUMjnI+2UqrgmCc21xNCV0Ljs1o
         kDieATIbNbaYNsdFa9t6zVw0wtgD+73YhwjjdfrizsYxVVw1eOXEk9rnMWNpca/gakr2
         oCipx/mWwh2y/T6QkBQmMQHztoPtekauYfLF8GkoATQc+WuMvree1te01h1FgwfjQ3Yh
         oHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722260241; x=1722865041;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TdarGSv19dLebhrk2LtQfRDEJjNlAi0LNP/ghMVcJ58=;
        b=ccX1N3Ho5MV9PLsaPUxcg1l9ItY0t3plWnfXP5v33owfpw58gnbLkrRE5uadEn9q3u
         I6FDnCLu+M+kQS3Ds5UpSHRodd0buMzWBfjSgsLXBJ5t8fY5TO/JXTj7Wi/SpSPjlasB
         zdGrQL3lnblDrOZIpnpVVmQtrBxxPaWOEZoqQdy5AXFOmtQtSNgSrQaldI2tsXc5HQWE
         U++as+hDMAiQY0ow4nPr+nvYc+4GE1HIhLE88D2CQz7ArFtNfluUbFonWVdORrYqbCkf
         lrGoVdOJcUuvNNdj5tL+mkHsNdQKqPgyU0GhxLZ2aRBhXFqt3yzJYMqMlfKr0kwkCSDw
         UYJg==
X-Gm-Message-State: AOJu0YwpP/nwSgqFvo5yI7RTD32b6SN7X2/vRCAZwKL0sKbfcXeQepUT
	QivNH4jPrXv3yPXoIOOyvixkRrM/Jm8UgMSepP3rvcikpMdsxse92CB6a/aJnOddN2JGp70cfab
	cjdMLgogLXDh9loxRdNnAK5H/YB1izTHi
X-Google-Smtp-Source: AGHT+IFmcBDAi+zAKe5ma3y+0yehk7LzkANzg0fXrV6FAIFrFUeGE4am5nTzcmkQ4PDaLf9ILQzwNIWn0QRhUxUFoHs=
X-Received: by 2002:a05:6a21:328c:b0:1c3:b26d:82ad with SMTP id
 adf61e73a8af0-1c4a11803d2mr7266847637.3.1722260240619; Mon, 29 Jul 2024
 06:37:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Asnaeb Dev <asnaeb.dev@gmail.com>
Date: Mon, 29 Jul 2024 15:37:08 +0200
Message-ID: <CAJCDZKwZ9t8UDpiV+JePhLL+t3vzFXJtrHJgRssGUkdetphB1g@mail.gmail.com>
Subject: Lenovo v15 G3 Touchpad input lag after two fingers actions
To: linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

After two fingers actions, touchpad movement lags.

When booting the system, touchpad movement works normally. After any
two fingers scroll action is performed, the touchpad movement starts
lagging. It shows an input lag of approximately 100ms. If no input is
given to the touchpad for at least 6 seconds, the lag stops.
Two-finger scrolling again will re-trigger the lag which will stay
until the touchpad is left without input for 6 seconds and so on.
Under Windows, on the same machine, this issue is not observed.

To reproduce:
- Use the same laptop model
- Two finger scroll anywhere
- Move the cursor, it will lag
- Wait 6 seconds without touching the touchpad
- Move the cursors again, it won't lag

Original issue on libinput that forwarded me here:
https://gitlab.freedesktop.org/libinput/libinput/-/issues/1024

Video showcasing the issue:
https://www.youtube.com/watch?v=gO4YvUimoYE

Linux version:
Linux fedora 6.9.9-200.fc40.x86_64

I will be happy to provide any other needed info.

