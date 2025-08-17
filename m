Return-Path: <linux-input+bounces-14057-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD925B29100
	for <lists+linux-input@lfdr.de>; Sun, 17 Aug 2025 02:05:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A44B317D37C
	for <lists+linux-input@lfdr.de>; Sun, 17 Aug 2025 00:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA647FD;
	Sun, 17 Aug 2025 00:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EW5PLlE+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A633E367
	for <linux-input@vger.kernel.org>; Sun, 17 Aug 2025 00:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755389134; cv=none; b=aUwKrBxAJ7+PjWPcOz5UBlqK737myiMKQ05T43U55Pd7/4uNwNH+qzK+MrFbxTG758S+/QWpfq6BbbIYu/QnGrftOIcOb2Y/GFUx8FUV+8weJvhRyzLgDToyYYAYgo2kKxvhTBePYw5iBpd+AY5TUe+oE2pYHyBQm+MnI7+r2eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755389134; c=relaxed/simple;
	bh=PyPkVfQ3a59itI3H2aT8qqmtCzyRplhU9nuRLlup6Zw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=VXMu2ME9m3pQnyrXF4z41j81Z0yMcEVjhmKXj+Er9zv2UGe2jyIf25n61g4jPOswoqjLeMQCch3aBZz5hcxNJXllQLnxJonSxJXg8mXeabPlRj6uWTrj9VRM8ACeCOzmWWxisL916sDslSOQ6Gj3H2kIWqSBfR7jaPQ/64oVBQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EW5PLlE+; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7e8704da966so215462685a.1
        for <linux-input@vger.kernel.org>; Sat, 16 Aug 2025 17:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755389131; x=1755993931; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PyPkVfQ3a59itI3H2aT8qqmtCzyRplhU9nuRLlup6Zw=;
        b=EW5PLlE+tx/pbDqnp0J8RO5xhlB3oBc3EGvKp/g2hWtlC5HlbAuKXc39+NmHPqnChu
         s1Pbaed1r6C3ol+amA4hHdv1OopQd5CkXOC3wiRmOkc6y0uS9nUY9UOOzcHzVehr2zOR
         eqEQP4r6JfVYTAdDQuQLmqErpTsazTgNmZGkjHXULn9DaKNrmXdLRDrMunNIJvgqiB7v
         vgNyv9wOdfDo3U7FXF/VBI1LghjqaCVId4hWu6RiRzy4yx8m/AR8hJuDghS25jgja6Ti
         zgL5+Vkkn+CH4zDSav+cGQPXLmuWwg/3fnr7ziwHT0qyw7FL00ImSxs1efGbGlfQlo3I
         ws4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755389131; x=1755993931;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PyPkVfQ3a59itI3H2aT8qqmtCzyRplhU9nuRLlup6Zw=;
        b=LWhdg5J8cuukp4rx0vrYfmwACJR0f7P0qMZ4NhF7qQ4gS93gvlj4RRl3IU/RGmErgW
         Kv5hhZ0r8FF9i3rTVOUGN3Ty4/MmbKtfP5bBPI5Za6V+OoF27W9u2WhJ7MCSWS59JJwJ
         p4Ss2/TW8LrvvlB07QXSwKVRz/o7geJX/6Lsr3aQ8rNHkZYCszWT7f4ixWuGcCk9buXl
         +JuITiJlUUslFSdSfEsbDdS2Esp8v/E94fM2b0h5WI3Hb0uv3lH8Y8JaccKDYLIXkO5Z
         3syluG4NXyAbIbE+kp1fm4xYXZsqyM/cyueNy8ihFBil/DDc4TXy7/d86GCJLafAXmt+
         ciHQ==
X-Gm-Message-State: AOJu0YztDcUodcVfC2xurcOdtZLq9rg3mQqrSI93GifRTiViQbGApSuw
	f88OKgvGsQNpTrNHj4J7Ec/4bniGNCfzODOAbSe9IRKimFfZpEP4f22g2rr6dbJHUC1Rg1+mt+y
	wN1W1R9+LdbNDWAZvpWHwXvO7BkCXJp35yhzGH4M=
X-Gm-Gg: ASbGncuboU+rqy9QLYT+ie5nJJc3MCcP3QwK0RTt+gGCc218LBXfomVxVljwVOJ7WfV
	Jv5Rw+yOIysPURRNHyTKQSn/T8l1/LH+5gIQPfsuTszpbgADSC7P6nVOm6vHCabsgTYAd7mDHjc
	o8f/ow/ZfoQD6ETg0A4RTAl3aT0LOBt7kUcE4DfrNSr6UfG7HlgodpnsIMUEJfRwkgqcsyxGoIL
	NO8m1k=
X-Google-Smtp-Source: AGHT+IG9a+GXRwOQZLYL9QYQYqqdfsMLfKLmrRUj3altIVOBnaSBGJRoPK/fGvGX7uBsPz6p/C7DSFLd3/bCNnuvtlk=
X-Received: by 2002:a05:620a:1790:b0:7e8:6ffe:23ec with SMTP id
 af79cd13be357-7e87df467c5mr956776285a.13.1755389131336; Sat, 16 Aug 2025
 17:05:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: J Deckerido <jsdeckerido@gmail.com>
Date: Sat, 16 Aug 2025 21:05:15 -0300
X-Gm-Features: Ac12FXzk6uZMZBymkQN6eTSVq0QZevBbeMC8HuwrJzva-7_i5ZeilA8S0XDY4po
Message-ID: <CABxuLgM7VmPvzHpOM=2cb6rXe_OY2-y2LFN68qNZFTtcwaD+EQ@mail.gmail.com>
Subject: goodix touchscreen: Issues on Ayaneo Flip DS (GDIX1002)
To: linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

There was previous discussion for GDIX1003 (Flip DS bottom screen)
support in the goodix driver, and adding "GDIX1003" to acpi_device_id
for goodix_acpi_match worked.

However there remains issues for the top screen:

1. The config from the device isn't read properly, and the driver
assigns the default max x y and a max touch num of 1 to the device.
(GDIX1002 has the same bus as GDIX1003 on Ayaneo Flip DS, former has
addr 0x1, while latter has addr 0x14, and the latter's config loads
fine.)

2. The touch data read from the device is only valid for the first
touch (if max touch num is overridden in the source code). It seems
when reading from addr += header_contact_keycode_size, the device
treats the addr as the original GOODIX_READ_COOR_ADDR anyway. In other
words, unless it's an issue with configuring the device, we should
always read from GOODIX_READ_COOR_ADDR instead of an offset from it
for subsequent touches.

3. Timeout may be too short, as the device's touch up events are
sometimes skipped, making the touchscreen seem stuck.

Apologies if some info is irrelevant. I tried to fix it on my end
since I have a device, however issue 1 is very confusing to me. Advice
is appreciated!

Thanks and regards,

J

