Return-Path: <linux-input+bounces-7713-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDF59B1BE0
	for <lists+linux-input@lfdr.de>; Sun, 27 Oct 2024 03:15:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1F3F1C20BC6
	for <lists+linux-input@lfdr.de>; Sun, 27 Oct 2024 02:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55F76E555;
	Sun, 27 Oct 2024 02:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LWEk783Q"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF213D9E;
	Sun, 27 Oct 2024 02:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729995341; cv=none; b=o+9SOcLauaOD+N/fx8A+kBebWZ79sBViYHm5ZoSlXTxE1+2iscb0loEMxt/UTEb8mq5dmZbE9OnPrim6pOwv78uhGAVw2HddqzeLzU/4t7a7zhl0gt8JpDgK+FUKkKh/BEB5i3xtI0V3VAI6NcYYJKlS+ZTNY+dRIXwpKP5uJ2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729995341; c=relaxed/simple;
	bh=hxyYesuKW8UwIewwsEyAhRB8GZYN0soW/MiwfKG+nlM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cDPQPA68Pa8ogAnc+iTqzkpGn62BlUh3jqqxWd0kYIdU1nGO0PCgeURv8qov0Inf5Spg6Wxh7KYj29gj5Gtd8WeKzuod6RBcGIxUuOr0VHrbrwu162A2Rhm9AvJ+53vE5mhYgEqDtWFV9Z1Zp7V/IGpIikfxUltw4aDgLKY9Gno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LWEk783Q; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2e2b549799eso2402249a91.3;
        Sat, 26 Oct 2024 19:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729995339; x=1730600139; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kn7556O2AaB8qeM5FvO18kqRJQd5qATE5xO+xdeHALg=;
        b=LWEk783QE3qHZtortmxS92pfnvms7D8I89gXWKOR4zMw14mQpO7nipn8rb6f98Wko7
         fzCva+amTAV/cFoPai0aNsgyudKY7/ZoD02Y/MWkFojztXWVomqKHegH1LM77bU9aE9s
         wUmlK35wIhvZQaTKIDMkAcORg/lV1ey8FJ3QjhvRVKsi3FdtIjAhf5SGouqXQVKy1aIJ
         QDlC/r8bYEX1Hu9WBsSa/dL4u1XWKZOjy7nSQp0vJPcrsVJE54jpJk7OWszWDur8btF3
         G5u064PGHPYsDXXBA0pH+9QslAXCCJrwnYAfbyCwFH/gSMIsDEjfI53/iSOnwGhEp3yb
         vlpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729995339; x=1730600139;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kn7556O2AaB8qeM5FvO18kqRJQd5qATE5xO+xdeHALg=;
        b=wMmY8wndX4t4BHfn3AmmvxEbQupvZq5sBITQ3V4KQZ4s7aitqzqs4sLaBVvKM9GY7T
         URt/S0Y/t1kqGmgN44z2rQix3GUSo7+3xE2+LEYO5U9u0Et3kxmeZTn/Af9cL5mzAtxL
         5Gv+OJeJbd/sra9prXPpgox0ZQ6w/bf7lS05KdJZiNP+IwZu8rucXwNHQIhXjdoNxIjl
         2YXCuRHE6MZxgqLUyo+/X6OQ6SSyTd4AnIgJ+f6ft+L1/SYMbn8MQqH+xhrt2HKYHk+l
         mH8aFvVn/FjiIeWnK0izs3K+enPTRxwvFnH84hlW7ytUgqhMsvPR5S/RKdCKeARLcovu
         OOyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzNNK77N+TwTzK0qTB5TQsA1XCNjgHd/smSdTjzJ6l8LJ8QWNYczh4TV4kIA/HzFKC3uo/O/6GGxUyljs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzbtU0g9wiJ9jl1+dPBkYqupxzMrsF3sn7RmQKitBX8q3CaSXq
	DT4mw3BHesgo9CW67aBqSINfLUCm4dj2eg3CwDLwFM5l8Og1DyHI
X-Google-Smtp-Source: AGHT+IENEg89SvDTJCqpYtjzefuJS1rHwhjH3fDPuTP5uGu9fpxx8xMfiIHHToJFRdh1bmKSuWC1JQ==
X-Received: by 2002:a17:90a:f301:b0:2e2:b211:a4da with SMTP id 98e67ed59e1d1-2e8f1070126mr4604251a91.14.1729995338616;
        Sat, 26 Oct 2024 19:15:38 -0700 (PDT)
Received: from xavtug (2603-9008-1600-2265-a236-bcff-feba-a919.inf6.spectrum.com. [2603:9008:1600:2265:a236:bcff:feba:a919])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e77e4e631esm6201983a91.27.2024.10.26.19.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 19:15:38 -0700 (PDT)
Date: Sat, 26 Oct 2024 19:15:30 -0700
From: "Ned T. Crigler" <crigler@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [REGRESSION] disabling and re-enabling magic sysrq fails after
 kernel 6.11
Message-ID: <Zx2iQp6csn42PJA7@xavtug>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

It looks like starting with kernel 6.11, disabling and re-enabling magic
sysrq fails with these errors in dmesg:

kernel: input: input_handler_check_methods: only one event processing method can be defined (sysrq)
kernel: sysrq: Failed to register input handler, error -22

after doing:

# echo 0 > /proc/sys/kernel/sysrq
# echo 438 > /proc/sys/kernel/sysrq
# echo 0 > /proc/sys/kernel/sysrq
# echo 438 > /proc/sys/kernel/sysrq
# echo 0 > /proc/sys/kernel/sysrq
# echo 438 > /proc/sys/kernel/sysrq

-- 
Ned T. Crigler

