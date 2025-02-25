Return-Path: <linux-input+bounces-10310-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD37A43341
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 03:45:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 804413B33B1
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 02:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 176A4F4E2;
	Tue, 25 Feb 2025 02:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1xETKwt"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD95BE65;
	Tue, 25 Feb 2025 02:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740451526; cv=none; b=GEL2IVuzW7bQqy7faOhaIZfi6rD3InRDmaJxSx+44+l2GG1sOtOjFEk/HsRpV/DHe07d6/wJ2gbdCezD7rkADKh4BHqNmsp2Upu9QfxnBAh2atdRJBzAaISKn8Thv9zyqTnpNRH1vYYgYMEHfF7Jbst+YfDlxVYlfz6YD2zGNXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740451526; c=relaxed/simple;
	bh=kt9ywlOUWtxl3bNCRJlN+hKgBBWWnsihbbxIcbkZT4Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PKv3qy7xZ7x4dTgfL5mqC2cO4ltSzoSqrmaN9g0Zo71+w4+6Fi7ooN5hGn+oFnQPVZvwxVzzldru9xhEfsTT070vujbR/PrbWMlA+3XOj2mW2pwEhcz8Ge5O2iPxynrzrGkB3As8fGUaSSG+xXU8nqWbUdMD6ClNEOilvn5zzpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e1xETKwt; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-220ca204d04so82644295ad.0;
        Mon, 24 Feb 2025 18:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740451524; x=1741056324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kt9ywlOUWtxl3bNCRJlN+hKgBBWWnsihbbxIcbkZT4Q=;
        b=e1xETKwt3n8E2AH4/QVCeTZGHUvNJERPK2ss7IA13Df5qozCNfZRDdzhmIt3AB8jPJ
         /peByyb2SOdxgM268o4ki2Iq6hsv4aB9lpUZ8NhHuGJGk74hzYc40i3uNTJtqCQKBvKj
         uW69YW8VzNLu0gJ/uVG+NNK4nWwzymYXxwUsH5k6udJpVwfkTQB9AcgodVPqqd8oqLkT
         dW866m9K+0aCLKBxtnAMe6tgWOYsQIWe6Wq2xKGTC7QSd7ZA1aSDm1LBvI4pk+2kvf2G
         ARtPnoxKPsiLK2NaeR+p+OKQ6b+WAhz/UroljrwdEcnInIXO6kqYKk+EGqNlVv5guV0Q
         2wCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740451524; x=1741056324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kt9ywlOUWtxl3bNCRJlN+hKgBBWWnsihbbxIcbkZT4Q=;
        b=g28/88ktW+UoXSJpDIRPpqDlafz5TIWw+DqhkYRD9KkkOiGj7DBcG50x1sv8oKPuQb
         c0+Lo2yYmVkCs3D3cADuWBTTu++kbX6DPytTyCkmyiysr7It4bThOTtkMKS43641zuHv
         gCuCiMn8wASnpbLYNVKkX4oD7ALixBk8r0JT0pNpj03jbcQ6S/w5EKadVuYgylme5ooj
         XFEOpuh5HGTrpxviMvyJY8s1mengQdzniUp0GHW9k5/r7pgFkANKI53RgLPCJrdca/EX
         vQ4n8bY/11WEk7Xj9dElg5f+1H/CRuzUUWhmosjGj+b3Y4G58a5KxADO/ewtcmIzzT1V
         +QWg==
X-Forwarded-Encrypted: i=1; AJvYcCXY/oIKO2sL5irtZEX53s0Ek0NhmRvnsnAs7UtM9vVzZMwMLKVun1+CniJR1GoEa4ZoJVETIYvLbItv7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YydfXTePlACbiABHY15EIJJOfAv+R+KWVwpxpPlaM+76hP4KJ9M
	zdq2LlkiVbm7w300aDTOvZirw90N0dM01o4KExDCg+EcpFsfEJez9MPi4ue0Rt8=
X-Gm-Gg: ASbGncu8rCMD9Qg+ed4n4Zu/0NaUxU5+nB0aSEvBDPqagYLQhyDhjVg6c6z422JOGtq
	Hcs3GIBunDxYnJ6CeR8DI22etW4scmFQXHjoazeBn5/7nfFNiIM5MSXQ52f3KNmk92MxEoDlUsU
	T25Jjbrb36sp/OcWy6gn53JEOWy7nTAQDDIeuEdJFMtENyBH08EOGhPiDpGA/gNvQ+fO4LPZN0W
	XWMQQpSeMiVE1B0CvCxBnshbPgaQTMktw1TXcr38sTClxdHkQuVo+bURkl4EVt2srRXTE1ei3fZ
	8+cf0wAKwRYGiotVbkG7GbiJpuyjujj2lr66PSA8WEOFB8KRSQ==
X-Google-Smtp-Source: AGHT+IGNv2Ue56wufq4fZsbm79rS0nk5+9pPBBkjtQ81OEgDGx+gM/IOzimnSIXbVGNfHD/4/8hcYA==
X-Received: by 2002:a17:902:e851:b0:220:faa2:c90a with SMTP id d9443c01a7336-2219ffa75bemr238478085ad.37.1740451523957;
        Mon, 24 Feb 2025 18:45:23 -0800 (PST)
Received: from localhost.localdomain ([36.110.106.149])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a092d61sm3202725ad.116.2025.02.24.18.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 18:45:23 -0800 (PST)
From: Weikang Guo <guoweikang.kernel@gmail.com>
To: Bastien Nocera <hadess@hadess.net>,
	Hans de Goede <hdegoede@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	guoweikang.kernel@gmail.com
Subject: [QUESTION] Plans for GDIX1003 Support in Goodix Touchscreen Driver
Date: Tue, 25 Feb 2025 10:44:48 +0800
Message-Id: <20250225024448.1467206-1-guoweikang.kernel@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Bastien, Hans, Dmitry,

I am currently working on the Ayaneo Flip DS device, which I insalled Kali
Linux with kernel version 6.8.11-amd. This device has two touchscreens,
but only one is functional. After investigating, I found that the second
touchscreen has the device ID GDIX1003(confirmed by exporting thre results
through acpidump), and upon comparing with the current driver, I noticed
that only GDIX1001, GDIX1002, and GDX9110 are supported.

I would like to inquire about the following:

Is there any ongoing development or plans to add support for the GDIX1003
touchscreen in the Goodix driver?

Are there any patches or workarounds currently being developed or available
to support this device?

I have also reviewed the ACPI description and can provide the details if
needed. Any guidance or updates on this would be greatly appreciated.

Best regards,

WeiKang

