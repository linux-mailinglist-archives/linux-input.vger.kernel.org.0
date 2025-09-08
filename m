Return-Path: <linux-input+bounces-14551-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F91DB49DA9
	for <lists+linux-input@lfdr.de>; Tue,  9 Sep 2025 01:59:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C652A4E561A
	for <lists+linux-input@lfdr.de>; Mon,  8 Sep 2025 23:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F651CEADB;
	Mon,  8 Sep 2025 23:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gJUj3LIe"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EE91CAB3
	for <linux-input@vger.kernel.org>; Mon,  8 Sep 2025 23:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757375956; cv=none; b=sMOwHjHhT62ZHv5lPE/jZYdnvVL7+AcQHiKTihHkLn+QCnxV1TuZ2PfZBggs1tKDOoanrktI/4cVz6aXLw1xl2kFoO9PWxcNXU0IMLjHKkwluufkK25l9TtCBPF9vkVaYLbR8o+Mf3ElGT9ATGyFDPna+iArmDNuzXj1MUH+DGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757375956; c=relaxed/simple;
	bh=LfBflEwZiwgZGo+IQuJ2vLx/0CnW2MqQuU5Xvqt6haQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wn9ETwnjdyd/85MUp43YEIjNg0KEwx4V+ivA88Dz6jXnDsmH2vv3KtGn/Vydy/oLTca5Vl2/KQNmLyZIcij1JfEywHtmXVUWWC+SG81nb1xqCN8hcl7mRfvb4qfWf+9eN9pmtV5Lm6m4iSvraB9F6khtDpwwx0h96aa2kmfqXP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gJUj3LIe; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3e4b5aee522so1569083f8f.1
        for <linux-input@vger.kernel.org>; Mon, 08 Sep 2025 16:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757375953; x=1757980753; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LfBflEwZiwgZGo+IQuJ2vLx/0CnW2MqQuU5Xvqt6haQ=;
        b=gJUj3LIeMs5eMFGtXry7s+3CYmnr+QpaKvbOhWH9RmB17wfIXkIeDLKfL2SXB/mOQT
         LFm83TGg9pHRzF1615EWbDAmvlA/OwpsWZl4cqDPfXroNxKUtchnkhkrsVSyOto4BGBb
         DKYDM/dRRJlRC/TbaKqeSexyeVb9vHGDGKx8yhiBs4jlWjBN1ovkQxGjsaTOUQ/VHJMr
         Wj29pVLQ7CG54W+4QbfsAc7SrDdMEBw74vc0FFcmhg+6F5JShbzK/qn5Xassd8aYsfpk
         4mqiRv7HpG4pkI1lknC8jyr0mqbXJpMx3O2g7ynRESqOyeKGY7nY3Y6Ko1jebn+ipaJR
         NcuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757375953; x=1757980753;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LfBflEwZiwgZGo+IQuJ2vLx/0CnW2MqQuU5Xvqt6haQ=;
        b=FsXJ8EVgElMyxEZDMn8/JWvtlAk9nOLeApZQUziKYBqFzc5syHlBmREnPDCZZb0JvN
         OfbTKKGvdR3SzgBGRKk+lXN99iqGjF9A+/1ny8+QxL4iLk/oUlfezzSH+BvO95w2A2Oe
         REEnyt7CHIkD2NLiSNh6CBVvqLZcMgkdZm/3gJFl5FRSpNsr3IpRcPfkVq3FqjDRChja
         aTm0g0v3d6l2mOLjHAsj/B0MDjfnatp4hE6QzmWx8Dne0YY+6oeJYkPpWKBkwTmW5BsO
         eFUWnEcXCnhEaj+oJSC2Lk+2JNMyRzt2tWSK0uTjUn4dgrATdkenlUUpvoXGhcdmFlOF
         IfZA==
X-Forwarded-Encrypted: i=1; AJvYcCV6weuMSw+kVCwchjkncNJZDQu5YmN7Md3SGwFMeQfmeSbCz8qHI8uo/MbaSm0xaeuMQl3/sadJyWBpcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzK82DbF0sO9hWj9pLCviXc8rZVYA3rDxX3zmFIooe2kNZyo40z
	EaUT6hAEhierXYu/LymrPXIsAtx3LPx6D58tOQ9q8l7aA0HCXQWLMO/mesbEho++4dXsgbDdgUl
	xQyf/oRV6EU4QLHw/9Y1UEmnVDkPBjnM=
X-Gm-Gg: ASbGncuvsqVAhp65O3r7ijnzIGP/wBjLj22m1qzVzzrd2l6L9xJaDzohePq5QkVEgX8
	3zOqo8LInBFR1wUqZLMd4U5z8H7hGm8pCwFDfoBkWuOTrTeneqUk9c8VSSu1RyEeaR+UIpwNagM
	N9c4gPHDQVlXdfMJISNtifpIqukdJDMKl1BN5+BtsV1Q/mUKBHNSSXzXjRcbqT9cjdjOuObbZbG
	LR7FPLHxNF8hNCKTaAkyDnfX7Dpm+9+BzfNN/CcyLbwDCwbzyU=
X-Google-Smtp-Source: AGHT+IHf3bt6exRtK3iOu5ZqAvMs4oo8ohcht+auq4TMPt1WffRe3v7WFERxEm3hZPhvXoKwtQp3U1cLqHAKzr/rzw4=
X-Received: by 2002:adf:b1cd:0:b0:3e5:e08a:56c6 with SMTP id
 ffacd0b85a97d-3e64392d49bmr5234170f8f.35.1757375952905; Mon, 08 Sep 2025
 16:59:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902184128.4100275-1-mavchatz@protonmail.com>
 <CALTg27=fZ+_2b2AXmKk5UcZG_2-zm2XP3+xzbSUrWdahD7ShaA@mail.gmail.com>
 <20d3b05b-dbe0-4802-b724-fe4ab5e279d6@protonmail.com> <CALTg27=Q6a2yJK6y3MUSzngsbnpXhv6vwtS_Y-t0LaKg1kK7Ag@mail.gmail.com>
 <f92cda21-12d2-4e4d-ae84-666c6f8dce77@protonmail.com> <CALTg27=vaZK6ksriDDoN71pqr0VEbvxAz7Dp1w1toG+tO71Ldg@mail.gmail.com>
 <12899c24-a16f-4d64-bc40-a06b4c5c3e6f@protonmail.com> <CALTg27=uP+jCU7oog41GiZrw7LX_mSfrQtKbDW+xpAHzN7_6cQ@mail.gmail.com>
 <93bf9cfc-29ca-40e4-baef-47c5bd0e9cee@protonmail.com>
In-Reply-To: <93bf9cfc-29ca-40e4-baef-47c5bd0e9cee@protonmail.com>
From: Stuart <stuart.a.hayhurst@gmail.com>
Date: Tue, 9 Sep 2025 00:59:01 +0100
X-Gm-Features: AS18NWANzEvryz_HhWUlZ6A3JSCu5QOcXCEHiJH5utwF84qHAIwya-Sib6YlQsw
Message-ID: <CALTg27mj+XcOmnMcH8vo5Bos+HxoWes-XW1eqfKDjnj5uqCc5w@mail.gmail.com>
Subject: Re: [PATCH v4] HID: logitech-dj: Add support for a new lightspeed
 receiver iteration
To: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, 
	benjamin.tissoires@redhat.com, hadess@hadess.net, lains@riseup.net
Content-Type: text/plain; charset="UTF-8"

What does logitech-dj do differently to the generic HID driver around the LEDs?
The caps lock LED works perfectly fine with the generic driver.

If that goes nowhere, surely I could do a packet capture from Linux, with and
without the logitech-dj driver active?

Stuart

