Return-Path: <linux-input+bounces-4166-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F108FE1DD
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 11:00:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E19C284B76
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 09:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC853155327;
	Thu,  6 Jun 2024 08:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p9u1i5sg"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8070C155321;
	Thu,  6 Jun 2024 08:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717664105; cv=none; b=NnuLTBgXQGsh18NaI2WPtwhqGhPCxE/eX336YosLDO2vaehIPA4qBQ1ZqBPZuDV6WnlTeMNIOzzX0BD9TwrHW9Kb+X2Xt/ltv+ijXvBsPQAJSqXrP98FjPExa3XDP9B6vjdAx8Aquqx765tqVmxee/HSoVatlMQgOMeLxv4rZcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717664105; c=relaxed/simple;
	bh=0pROA57N6Ugnovggi65CM/CGDihd91zTCcizHKA9HXA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Zxg16DpPomAwgEPwNW38mHNXV8e5B5IWuf5P+hGoszVj2ITNBOaKa8ElOZSuCrlAyT+a1coNm8nKt+EBtyVZsa93m6VSlKg3nc391/+nG0gwPXEDCH3fTOx3c14rIXroCoI6xdzt1nrqIZgSGNy1Kj85C8qYyxbwUpPdGiJ9XHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p9u1i5sg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5403C4AF18;
	Thu,  6 Jun 2024 08:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717664105;
	bh=0pROA57N6Ugnovggi65CM/CGDihd91zTCcizHKA9HXA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=p9u1i5sgAGkonPawq+Bx6YradAChaeJL3Jubjr0MYpZhBBTgGnbbKDUKUjef26EuK
	 R5z5+PAjOzPG+lYF/b/NAnEEokxdjLMqDWnihQSbLyaej9NRHd+KsU/mWNkAZigqbk
	 w9EPoeedyWyr2RipYJbvso3TbjzhaE0xG2Pm/7nDwq48/qiGqW98jmXA+ayyfGPDak
	 CJNM7wcqcsMaqqit5eAH9+nEBmt9kQlOmKp1MPEmD/2o8pPccvnX4MEZmyLJy8AKHQ
	 hf/dRXvbsqgFj6LSrQL+2wJzQA31hSam2Eiq1cI2sx8raYo+BBeUXGembDwuCKzu5S
	 rf4aB3cUpOkmw==
From: Benjamin Tissoires <bentiss@kernel.org>
To: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Jiri Kosina <jikos@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <20240604-md-hid-logitech-dj-v1-1-560f6b3cb54b@quicinc.com>
References: <20240604-md-hid-logitech-dj-v1-1-560f6b3cb54b@quicinc.com>
Subject: Re: [PATCH] HID: logitech-dj: add missing MODULE_DESCRIPTION()
 macro
Message-Id: <171766410366.2923458.4262104471305279812.b4-ty@kernel.org>
Date: Thu, 06 Jun 2024 10:55:03 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4

On Tue, 04 Jun 2024 08:34:01 -0700, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-logitech-dj.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> 

Applied to hid/hid.git (for-6.11/module-description), thanks!

[1/1] HID: logitech-dj: add missing MODULE_DESCRIPTION() macro
      https://git.kernel.org/hid/hid/c/ece3941821cf

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


