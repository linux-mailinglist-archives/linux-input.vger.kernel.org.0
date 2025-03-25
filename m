Return-Path: <linux-input+bounces-11248-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6721DA70794
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 18:02:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41150188CA84
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 17:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61F1642A96;
	Tue, 25 Mar 2025 17:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P6tnQmUh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69722E339B;
	Tue, 25 Mar 2025 17:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742922117; cv=none; b=kohJuJ3MjysrgJCseboPc1XhaFENceoXBAU9TKeI96eQMoJIp8BjKRoayKqG9KVYUj4Ad2QCLespyg5nWKScIqPlMzHrZojH1QLLAu1iR82dTC5z6t8I5mncbC0TZ57nMhDvpER0trTGo2XvEz5Y93Arl34ZTemvgKeBNEmZfZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742922117; c=relaxed/simple;
	bh=5uHZVG55BLXYt3QJ+OPRMQIH9Tw7zSfEgwJaDSo8WRU=;
	h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:Cc:To; b=Qx8lgGDQcI470ltCZc2YV3fcUPTT4V1vwQ3kRnpudFkCw0BeP3VsSDkq4rXoZe1/yIhtqyWw0xEJfKPV+c+pTe+dHfFhrNj26duCJcVD7TjZwX1wUVcaKX0bFR/ZNCQomcomO16cI7ehXbXEPZYGo5y/1zt/qzUXVs9DXPuxuHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P6tnQmUh; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3fbaa18b810so1701235b6e.2;
        Tue, 25 Mar 2025 10:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742922115; x=1743526915; darn=vger.kernel.org;
        h=to:cc:message-id:subject:date:mime-version:from
         :content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5uHZVG55BLXYt3QJ+OPRMQIH9Tw7zSfEgwJaDSo8WRU=;
        b=P6tnQmUhJ/RhCOhW3nQfO9jsB84wd/L04KA37fEKYfK6BbvteTRdzJ0qOBeSdQJ+68
         iGCpSznrpc5FRjTK3xfzcXcFvpvc6+8ktg83JyeUzZszTB6lZ8MpPg8iAq7n8X7JZiVz
         xFtimQYWkzKgaG2CI4ssUgfC/XeaLjwclujk7FSRawuxrqgRgZ3fsLwzKr1dzZkxOmnI
         Gf+1XbOUaGe2PmKzOu0WHAbWB7VmlkyNzHVujDV/0Ow0jmaTkwnZII8V2E/cp9i94Uvu
         6HiU7U6bTuBXnhk9Mq2MHQ7B7Nh/cdw4ZvJuGezGlALdwht4iKyUvOB5ju9UOQ5XJEaY
         eniA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742922115; x=1743526915;
        h=to:cc:message-id:subject:date:mime-version:from
         :content-transfer-encoding:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5uHZVG55BLXYt3QJ+OPRMQIH9Tw7zSfEgwJaDSo8WRU=;
        b=wcx4hOt/VYUXd6QokqzXjkKmz970KIg+iVRYTZYsM/rI1Y7pd9icqBMzrobk7uN5XQ
         LYIWW2DUzy+rKhkqyrZD7R1PZA2HSyEyliAcAY5EoNLSsu5QO7dfgLfRnPQDWp54yLEk
         dKv+Usvg0L5MtwdMtl+JwGEKpiGKzFpGQ8g0gBReZaGl3bPqcQ/5q44QaoS7Yy8kRd+J
         D5mxfzZqUhIZbM0wn06zXBoEPwdf8OFCTKQNZBjUiKLTVOYygmbtquEJZA0y6Lpp7kP9
         SKyLYJhH7uwZzR1/UF91TIh3oLwWHoc40ToTsXLkpYcUUf6Dl4P34yb5KTeKlRxdAFj2
         tJRg==
X-Forwarded-Encrypted: i=1; AJvYcCU0JdytMjD4FwdYuI6NuplKnK9+GPL1iITzyThKdOklWMmoMRBFS0+ODuOHjsThW13OzKrFqbRTTz4Qlg==@vger.kernel.org, AJvYcCXzOZYUOG62Xe9CsA4oXVNohzuqon3sFUMAjPb6Pxvj/FOkJWQiupYdQTMBMTMOYyUDcucoBfNo67tdWF1T@vger.kernel.org
X-Gm-Message-State: AOJu0YxO9Y87LrEEwzg1Q9gI/qTbR49BN6Pvurvsa3uyISeph+y1hd/F
	oI6bRiufjuJSjUkC4g4OVTtzFp+yviVR3Z8iiTCe+L4dHZ0QdYsidR6cEolLpNg=
X-Gm-Gg: ASbGncu8pwcbPAmacfY2l8fS65VWkFl9ExVCAq51c5nCIPOBeWSmYh4hfxXSHUQqvyj
	KmzDzR3XN8eDbPaSPLOaOXeouN+srVt8OwqZqcRHEN8V884KaR9DEP8xXHBbzjEmmLlZqQ6zqlP
	9vnb7hbYw/MQXPikDS2/9zrVWWWlodJAIFQCQJwqoXyEz4oASaqsjioi7f3k0fAyOPgZhLM25Ji
	IFecaJs9rfmauwu+j4KbxDEsdmgzshNubajzL9smB3u0zVSj9IDEkxWi+ck49igbX4sV6dma+rk
	8pGnabeY8bA4B8dV+9EBsbb9VG3pAFEnfqLrr2AVcLCJxZ8UPRV/QRLoXnuSaWAsbpl+ManEfaN
	+hw==
X-Google-Smtp-Source: AGHT+IFUqbhSOYGU2uj230PhCbfEpiTRWdUy/MBvzSG1maPYl9cwZZqHWD5mo4BOmGVgdf69mO5OYw==
X-Received: by 2002:a05:6808:1241:b0:3fa:8bfd:7748 with SMTP id 5614622812f47-3febf72cbf0mr10329911b6e.22.1742922114549;
        Tue, 25 Mar 2025 10:01:54 -0700 (PDT)
Received: from smtpclient.apple ([2401:4900:5fb3:22d:b894:2ac5:970e:769c])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-86f9f3c2cf4sm2016803241.19.2025.03.25.10.01.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 10:01:53 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From: Aditya Garg <adityagarg1208@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Date: Tue, 25 Mar 2025 22:31:39 +0530
Subject: Re: [PATCH RESEND 5/5] HID: multitouch: add device ID for Apple Touch Bar
Message-Id: <02F14282-87DB-4EF8-80EA-3D0887F3C30E@gmail.com>
Cc: admin@kodeit.net, benjamin.tissoires@redhat.com, gargaditya08@live.com,
 jikos@kernel.org, jkosina@suse.com, kekrby@gmail.com,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 orlandoch.dev@gmail.com
To: bentiss@kernel.org
X-Mailer: iPad Mail (22D82)

Yes I can move hid_find_field to the original location as well. But, I would=
 not want to devm_kzalloc as well unnecessarily if the touchbar is in the ba=
sic mode instead of drm mode which will cause this -ENODEV to be executed ri=
ght?

