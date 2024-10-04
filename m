Return-Path: <linux-input+bounces-7078-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 728B69904BE
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 15:47:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 285C0284480
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 13:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A75B212EEE;
	Fri,  4 Oct 2024 13:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sij535pq"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EDC2101A8
	for <linux-input@vger.kernel.org>; Fri,  4 Oct 2024 13:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728049617; cv=none; b=XGFbd0Vtcd0kBjE3DL0fHynOQM1Yms5SG5ZtGBXDv3P53Y8eX0tWXoCow3OaXeNJBu2Zxn3aKVFlzpPC4j5tTpI3zSCHYAzYUNbzqchqOj1j6SmfkxyhBB00W4MuLLCSZAPfWkFD3pw54UGfCgHMZZ7NXeZt9Pg2BLIY9Jb92ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728049617; c=relaxed/simple;
	bh=oZbY7cjUlUXs+rZdZPhUrlKHoQ+v6J/LO/oK31lbn4A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PgvdJVbAgizT6VKQ/U71COa35r8wV0Uv37+2t8TpLN67zFu+b/MFj14BOG/fRbmB27PDUPPFeXE40eyxYXr6b4rCTte2a+DUpXqJ+ocM5elBh8RHJKGmrm54XDi9yysNtfUQASwJ7YwwKXRJd8pJwJce8nkaOl2W1orl7S1meS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sij535pq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A1D5C4CEC6;
	Fri,  4 Oct 2024 13:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728049616;
	bh=oZbY7cjUlUXs+rZdZPhUrlKHoQ+v6J/LO/oK31lbn4A=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Sij535pqe2DD4Zm3C96yS1cR6Pf/OoGNM9YCNdZ9rSG6pW6ALTgZ6LdlItMoJqZXk
	 1OO4zaG+blB/XVSXSimFbLeBNhNInDbLHsMqOhZ7Xc3Vj12vs5+rIwnZK56zyg8vYW
	 Z2xzV8TyDkVJgkHOWzLTqE0bwO8eA2ES7EltYY9mcYvV4NSYe2iJVGAUWHCsanAnfr
	 1HEa4eZnwGeOPcF0cLjVXviQMNEiuFj2VqQiJ7pevqjvPcZvzgv69cnJnfCPLOoLPZ
	 6PiIQGIe+x7qG2k2xAHA/gjOCQxN+FFUUqCTHgP5f5eAxlwncH9VJsn40lYoE1ELGc
	 v5IjTFcP1sj8w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B323CFA779;
	Fri,  4 Oct 2024 13:46:56 +0000 (UTC)
From: Nuno Sa via B4 Relay <devnull+nuno.sa.analog.com@kernel.org>
Subject: [PATCH v2 0/3] Input: adp5588-keys: refactor adp5588_read()
Date: Fri, 04 Oct 2024 15:46:49 +0200
Message-Id: <20241004-fix-adp5588-read-refactor-v2-0-275a093758ae@analog.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMnx/2YC/42N0Q6CMAxFf4X02ZptMqk++R+Ghzo2aKKMbIZgC
 P/u5At8aXJ6b09XyD6Jz3CtVkh+lixxLGAOFbiBx96jdIXBKFNrpQwGWZC7yVoiTJ67MgK7d0z
 IZB0Rh1qdDZT7qSSy7O57W3iQXGqf/dWsf9t/rLNGhYZIqaAfl6Y53XjkZ+yPLr6g3bbtC7Cfo
 yzDAAAA
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728049615; l=767;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=oZbY7cjUlUXs+rZdZPhUrlKHoQ+v6J/LO/oK31lbn4A=;
 b=XHBzVocNO/baFkv19sn1LrVqmxrRKLvUQHt+7x0VVkAJyqYwBHVTTzYA1qtBkdoiu7QX2GkSZ
 vOz35NoCgkkDfq6avibKeeaCAfxbDuwSBpU7FtRgKxPSzXiNAKVXKP9
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: Nuno Sa <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

Hi Dmitry,

Here it goes v2. I ended up squashing the patches as the patch is still fairly
simple.

---
Changes in v2:
- Link to v1: https://lore.kernel.org/r/20241002-fix-adp5588-read-refactor-v1-0-28800f1b9773@analog.com
- Squashed patch 1 and 2 so that we don't return an int into an u8.

---
Nuno Sa (3):
      Input: adp5588-keys: bail on returned error
      Input: adp5588-keys: error out if no IRQ is given
      Input: adp5588-keys: make use of dev_err_probe()

 drivers/input/keyboard/adp5588-keys.c | 151 +++++++++++++++++++---------------
 1 file changed, 86 insertions(+), 65 deletions(-)
---
base-commit: c684771630e64bc39bddffeb65dd8a6612a6b249
change-id: 20241002-fix-adp5588-read-refactor-a85c88af4062
--

Thanks!
- Nuno Sá



