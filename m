Return-Path: <linux-input+bounces-9969-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC3BA318F2
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 23:42:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F352416A3F7
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 22:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6487227291F;
	Tue, 11 Feb 2025 22:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VnZM01BE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BAF272931;
	Tue, 11 Feb 2025 22:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739313615; cv=none; b=p2P6GYQyZxigL5dnEbOqSJzi5OPPsakOi0wOVpA7KmgTKyClUIyucT1Af+dfnggj80JFTddVicXTqTx4wQCsqZb3DKIssEZBAY0Np+tD8QbPGcKpNBXyTlf740KFDkt8913CwHkOcos5aRoDfrc6METJ3aZjStp2XFTw56EkQKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739313615; c=relaxed/simple;
	bh=NNxrtO18GZ4dS1TCwUxF0B+yGMSUs8j5v77nPirBMWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gRtBCI2ISKuDMtR+7xSLTkUO2529+Iapl7zNKYKx56wNgDaY/EfSKtebllxTgwf1usD0yF0yNdWzGbLwxJ/kNS/UEcCBHUhfq/lCfHkTCDZyHx2orjCeVLhpYoVXF2fepZiWqXLXLxqeLWFUiBPsrxgB9iqt7byDweju8tK4gfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VnZM01BE; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38dc9f3cc80so1763898f8f.0;
        Tue, 11 Feb 2025 14:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739313611; x=1739918411; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NNxrtO18GZ4dS1TCwUxF0B+yGMSUs8j5v77nPirBMWU=;
        b=VnZM01BEH7WEh8XE0uh415NSRwHtOUBTEZe1xvkJOCpgU9p1u3NeGcpDTb3JabAjuy
         z8v6j80bb2CGJEx6NsPQXuMlg1vYz9E3jDhzIya+TTJqLpZusxHzNlwaRYblsBT3jLkP
         6sPHg+1aIYs7Vtt5AfM7p5tJwDr2u8K02yhUnX9uMuebgtQGLaAe8MN8XzCdcMtX/278
         jKZ8byGmxuOrjsnbiM/3PIdMZ58YTajMAlIWwtES7wfxE2F7YrlSYisjtpC59Re+6AUy
         PstcshQvUTJMIsF01ZwFwbXudrIyMzOtqolHQ5LbUHXoNsPMWDLfjsRzp8RTMdGAY/YA
         oMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739313611; x=1739918411;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NNxrtO18GZ4dS1TCwUxF0B+yGMSUs8j5v77nPirBMWU=;
        b=NGN5XzXajxCGM3DHTdgiuHAM8rRUGdmK7YVUp7ZiF5mWthBMLnXHKZxtR2aFVQ6RQQ
         tc1w2ojkVg4rLBh3dLZbVkja9uAYZREujuWT8rnwwwO0ZSTl+P5TZGrUlV8oQxj1XePM
         orCiFWhs+NjAjn0jGwQe1rR5mrgp/RHD/fsQcZIgLNvjStSrQv6022SpTX51xUv0xMyD
         iuav4IAfglI7yqhjEVxNLywd/RY5Mo5bxXPhsmQDbmWmFHK3Ttj2a9BxeGff14Vpi58D
         1D2tZuIUjqDqu5nsZnAZdZo6+grzNOuNjGk34YahZygtGu6GtXdSVikS2XEzKfhnEu8N
         xzbg==
X-Forwarded-Encrypted: i=1; AJvYcCUDSEFIMed+Dk3SPAcxstLq4UOr3ooHbsrlODZnTsH66mONioGcow7vWOgU+Mfe217hAC6H5rI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBm5uQkiotsXWQjflpta0aivOyLNgE2wwkkdvaHkyGWje6gDJK
	9J+wUn39FLnzkrASoFYvYcdt2lDZVdEzI2tE2VwGRMyvtirjIiDuG5wEbn30n4O0ZLfACWfvjGR
	D1Snck0Vd30BH9kdSg6hdDuEKKRKcDMym
X-Gm-Gg: ASbGncuNwGPfyRDNHnbrsnCI6INg4+M9c58EBXO1RqLMcKVHT6/NVesZL5TebxhhQ6s
	58nPRSfAE9gVV4hPFQWTTLq4adzfB9eqA+PxMVQGSsL4i3qtcQK1LJe8nSd+v83p5IXIrCSFNmA
	==
X-Google-Smtp-Source: AGHT+IG46pBy2FPQ6rt4xrqHMQHWtkChBV6sfTBLfvu7fMz7Q0jy8kxHrNhoDt2anVWXlYcvHS96k5/8f7WmJ8bLWRE=
X-Received: by 2002:a5d:5f50:0:b0:38d:cbc2:29c3 with SMTP id
 ffacd0b85a97d-38dea28d03bmr586397f8f.33.1739313611022; Tue, 11 Feb 2025
 14:40:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211213833.9182-2-stuart.a.hayhurst@gmail.com>
In-Reply-To: <20250211213833.9182-2-stuart.a.hayhurst@gmail.com>
From: Stuart <stuart.a.hayhurst@gmail.com>
Date: Tue, 11 Feb 2025 22:39:59 +0000
X-Gm-Features: AWEUYZlSAoOZ4pw6NsobzIoLIP9LzzucrzNMaDXSZ2G1rv2H-T93x0m2o4GwZd4
Message-ID: <CALTg27n5ECDgOUc6x48b_Qen3QdpuG3WBYUOezN5v+SVMvJ9OA@mail.gmail.com>
Subject: Re: [PATCH] HID: corsair-void: Update power supply values with a
 unified work handler
To: linux-input@vger.kernel.org
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Jiri Slaby <jirislaby@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Whoops, I forgot to actually remove the mutex despite talking about it

Ignore this one, I'll send another. Sorry for the noise.

Stuart

