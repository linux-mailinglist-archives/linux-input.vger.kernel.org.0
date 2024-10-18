Return-Path: <linux-input+bounces-7537-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 687EC9A3E8F
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 14:38:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 973761C20AA1
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 12:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A64718028;
	Fri, 18 Oct 2024 12:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pfnel2R+"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7327B3207;
	Fri, 18 Oct 2024 12:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729255101; cv=none; b=Oxd4oh1f9uSw/+b6wbSN90qeoaJUiAUl+MXniq6gHJQNbJDi1DmVlJCANv6VaQU/nXzGR0PM/EpY5prAZSRad+/1TCD2vSTWhJf8I5zj+EquCbB35PCXEXs/A7V46ZwV6dZYeWx/lCY4wZfDcjZYykpNZqls2pjHn4NvYA0A6Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729255101; c=relaxed/simple;
	bh=0QmAt7dRXX4M2u/hKZTugqWV6cGeNe4hmnu3eRxpa7A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JapOfRBNQSQ7RCoUz74JE1KySxcxcwu8FSTAlGez1QC1YKcHbf44Llk5zGBCtIewzTIPtwi4Y1Yht1ofcoku2Yo2RqG3lVW+t1BLmUwtYDC564wpJpFBmEKXh2cu/ZqN71KtIoMNI8Z7G1BryF8Ezh8xKi3TGbHiLTr7iua4e/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pfnel2R+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3354C4CEC3;
	Fri, 18 Oct 2024 12:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729255101;
	bh=0QmAt7dRXX4M2u/hKZTugqWV6cGeNe4hmnu3eRxpa7A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Pfnel2R+pKP292ADeHa3Zd78K/1SjGz6LZQVVXMakCpz3Vl7Dw1K6sBH/iwgMJpwl
	 HNUTLjhCeG4BxY/qSHc6iGJatZRWzug0IgIYQF69ILDyvW8Sc8TKUmwHEL4zfYRpCG
	 7HP+T5H7hX/Py5vkxFBLRoGEsKxMASMLYdMKfY9hyEoeh6owv2BheWKIO9HD6H51RR
	 nI6VytCpmxV5YdUq4IXe98GnYF1IKTHP0KZh8amwPdmTBIuyae+/W2PNufUtwBMmlO
	 zx5uN138t4DMYVEh4Hlz6/bnVfZZGM+h9ORnsPoJ64uDq3lG///FhANwVuvvcOJEEI
	 CVC4mB15MSvmw==
From: Benjamin Tissoires <bentiss@kernel.org>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Tatsuyuki Ishi <ishitatsuyuki@gmail.com>, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>, 
 Peter Hutterer <peter.hutterer@who-t.net>
In-Reply-To: <20241017-import_bpf_6-13-v2-0-6a7acb89a97f@kernel.org>
References: <20241017-import_bpf_6-13-v2-0-6a7acb89a97f@kernel.org>
Subject: Re: [PATCH v2 0/3] HID: bpf: add a couple of HID-BPF device fixes
Message-Id: <172925509938.2215715.2616658993729589927.b4-ty@kernel.org>
Date: Fri, 18 Oct 2024 14:38:19 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1

On Thu, 17 Oct 2024 18:34:57 +0200, Benjamin Tissoires wrote:
> Both files have been in udev-hid-bpf for too long.
> Both files are actually simple report descriptor fixups, so
> there is not a lot to explain here :)
> 
> 

Applied to hid/hid.git (for-6.13/bpf), thanks!

[1/3] HID: bpf: Fix NKRO on Mistel MD770
      https://git.kernel.org/hid/hid/c/9bc089307e8d
[2/3] HID: bpf: Fix Rapoo M50 Plus Silent side buttons
      https://git.kernel.org/hid/hid/c/cee9faff2f65
[3/3] HID: bpf: drop use of Logical|Physical|UsageRange
      https://git.kernel.org/hid/hid/c/b6d8c474e265

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


