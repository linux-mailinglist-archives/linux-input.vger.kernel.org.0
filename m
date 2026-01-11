Return-Path: <linux-input+bounces-16946-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D467DD0F8AD
	for <lists+linux-input@lfdr.de>; Sun, 11 Jan 2026 18:58:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AEFA530478CE
	for <lists+linux-input@lfdr.de>; Sun, 11 Jan 2026 17:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDB3C34CFB6;
	Sun, 11 Jan 2026 17:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hpp/6ci2"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFEF1E5B7A
	for <linux-input@vger.kernel.org>; Sun, 11 Jan 2026 17:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768154271; cv=none; b=mbafUf+91g7tY4TFnZ6kXuG6GscPmdVEJ9IDPoPZGkaD4LPz1jcuX3ln30c3H8T28XFbElQAtlk3i3UhR8NV/UaIVsJYRJSooPf5oHj/A7ZeP9RpBfC6dPEEJ+YDCcowI6/DoIYV7gI2KAoEe78dwBSFtgaRiBIeJT5yHsPMRS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768154271; c=relaxed/simple;
	bh=xpet96qs/MpLbbNcOvZu+vPaNasj6RBR06bD+URQzcg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=R6EjG5bBqGaibjIkwmuNs/+n8OWqTwsHoeM2ruLD89nhF/ZrjQReSmqKIOhZRMBiR2eAwFTIYooNvBkPA6KnT20UHkfEdhzXKskF+F0ZkiXbXd2pC9T52oLJNiB8OltZxy+I2JaZq9fBmpuyD5DMnDvbHwcRS/zP/mRyd11SemQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hpp/6ci2; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-3ec47e4c20eso3584703fac.1
        for <linux-input@vger.kernel.org>; Sun, 11 Jan 2026 09:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768154269; x=1768759069; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VDUaQ0tUBkZ1O3VBGAVMLLN/Iv0SyvSHTscUbUhhUBw=;
        b=Hpp/6ci2yFbCGaGZEethFLpTgL8T3sXNxtAJKdY/si42cKNLbPcaGmcXUXBVX7ONMX
         SC4VU4Ngrce4tGUhfkqc+Gi3Xwp7bUd4lCIG8JGfdxpvE5FnPp2cL9f3hMIBBZSKkoKY
         6h3o7xTBjLLE1Ih9p2xkCdUNkxSXdGZrDlX2nYS7T74ojwqwYSWZKnYL3bF21PnxSCRl
         21o7SyOaS5OTh5EbYv+faqCGqO64l0nGaZg7bjOAZsQd1K2nQTtTMuaa2Ux8pMpsGIhF
         JRisS4zGJxY30+hYnBQjNIHIqZ2JSP08gl253GctIYTWNJvTnE1+tkYGATwBF+i4hcTF
         abYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768154269; x=1768759069;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VDUaQ0tUBkZ1O3VBGAVMLLN/Iv0SyvSHTscUbUhhUBw=;
        b=F1vLQcdcVFyqS1zKmSnUIRxrOAKylPrYAL9ofr9wW38Ir0TZcDxxARvckvywP4lJjr
         fr9yF1V44Ai3Px/tpe4hK/sAwHR9yiG0n6Ld4dPn7G8UgsorAqVQJ/hpS7oVoaeqWbQF
         PN/GWjqmITOck7dr1ByGihBrb1cDTWX3ccakh4c81JutKw+5UcSDhUh+L6mo+l6O7xpJ
         PVhQSCSGcmWuJoI7B/fckx/NB6GcsigOmIaR5xya96+2G3MErGAmV7LkAL7PhIP/L770
         jM6gVhhLlpWyR+6RRsRUDBiy5E75MCkUV51xnMwK4R4mBmkb9J1XaIx9p4Wu5uRYnKwq
         2J0w==
X-Gm-Message-State: AOJu0Yyvwyxz+KzcI5YKmRpjMgxw7wGD02rudrnSobLpDyqWLMAG4TM3
	8NRRhENn2c78klt4RT9mLDCeN8y1I75E/1E2oLqEtVTWPY6i98BCHWtFChfA/i2XhD00F+JH8BQ
	EwMsRPvHis36klAeRyg36nU29CP+6UoqEgMIW
X-Gm-Gg: AY/fxX5fGZN3HaeF4rbAMSPKBu8crLkNWM3B1zDanmiYvZcn7hGeAw8n3w65gRhVZJG
	Rt0KYoXX8kvbvm/T1ZgSbs9AlnCVoG22o9GhdGkD4nxbCnKM6ke26wmh1qvgNiB8aocIfI7TAkR
	O1bnD/ckGTlUVq0bNZoeGYkDtFR7qWCpFTSNpa1IxCQ5QlHZCPBSsFaZTzJB6YN9cP4KiYK1bNS
	smowOLXpv0Mw/EvT8+dmz2QO5cZdV5ASXZJNAW6rGOlH+4Z2eHSe8stejWvKLenJfHNAzQyzzEs
	K2kGGily6tuQrYivOW6UGdFAHoraxqwWh5M7f3E=
X-Google-Smtp-Source: AGHT+IHMbwJrDxmKGVjo4s9x2OxUfNjmJr2pJgyJRT7jvCNYxcqtWUqs6oDNfJIa4leRUVCpXCHovOlQE2eJx6ErVYg=
X-Received: by 2002:a05:6870:6c08:b0:3f5:4172:11 with SMTP id
 586e51a60fabf-3ffc0bb4cd8mr7527432fac.58.1768154268781; Sun, 11 Jan 2026
 09:57:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ronan Marchal <ronanmarchal29@gmail.com>
Date: Sun, 11 Jan 2026 18:57:37 +0100
X-Gm-Features: AZwV_QjhI7xkglE79-Xp_9ZVz6unV_v9a5CrQXnKVQDLnUXjdTQno7NKoaC1_oA
Message-ID: <CAGbFfZEQzM3nwNz5vRup9PBpmN5=+o_gMGSKLfTtN7FOLeN23A@mail.gmail.com>
Subject: Proposal: Kernel Driver for Logitech G29/G920 Steering Wheels
To: linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I=E2=80=99m considering developing a Linux kernel driver for the Logitech
G29/G920 steering wheels.

Currently:
- Generic HID support exists, but Force Feedback (FF) is mostly
handled in user-space via SDL/wrappers, which can cause latency or
limited functionality.
- Many Linux gamers own these devices, and a kernel-level solution
would be beneficial.

Proposal:
- Full kernel support for G29/G920:
  - Axes and buttons
  - Force Feedback via the kernel=E2=80=99s input subsystem
  - Compatibility with existing Linux gaming APIs
- I plan to leverage the existing Linux kernel input API for axes,
buttons, and Force Feedback.

Before starting development, I=E2=80=99d like feedback:
- Would this be useful for the community?
- Are there upstream plans for this functionality?
- Any suggestions or pitfalls regarding kernel integration or maintainabili=
ty?

Note: current Linux kernel includes HID support and
CONFIG_LOGIWHEELS_FF for G29, but users report incomplete Force
Feedback usage in many cases.

Thanks for your advice!

