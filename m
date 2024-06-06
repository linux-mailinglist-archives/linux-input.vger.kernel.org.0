Return-Path: <linux-input+bounces-4164-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F2A8FE1D7
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 11:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A81B71C25429
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 09:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E9D0154454;
	Thu,  6 Jun 2024 08:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S1bpnO+x"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4146F15444E;
	Thu,  6 Jun 2024 08:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717664102; cv=none; b=lQB1Cw7+6CPjgI8nPDrxNJp+EmSYCq/m9sbBHEVFL49kjq3Iqa+qJcHuLwflINmgMnMTjzkHgmSLo2GSOmFwGt0qqT/whfNVv8NDLu5Sr3KQnj3ZmClxkJZh7qXDlvwxKyLRCQxG3Xih19TndmvFxUsn1PSndgUv7E4SW80wqKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717664102; c=relaxed/simple;
	bh=GrLQsKoO8PynBBX2yxctxKTfAAfdVDgqpg7Ladr3AWU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mSPzbTADWUxN/YpF0tmTOVaYvU7n4CY4/XC7aPeKGcs2vd0lwXSP6gwH56cLCVUExWZ37KS7u2uGN5AXPwBUQudflkKy8YwwcHNtzsgJ4VVsMyDLqT4zyfgIysluP+aNO523ns8yMFcSPylT7Me/TUVVqq14k9TPimfrQNT7CeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S1bpnO+x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9951C4AF11;
	Thu,  6 Jun 2024 08:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717664101;
	bh=GrLQsKoO8PynBBX2yxctxKTfAAfdVDgqpg7Ladr3AWU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=S1bpnO+x7y5WDgJ+TgIcxifHBs09d9/Jg4goldjC5PlcvfQuDKRzOGedTSQh3iv43
	 SXm+IZ2MnLhXdfQ96yJvBicjPjVWveHEFVSG1VGjXAxjNzwf+Co0uX93HnNpK6pw54
	 VrhwAGKypOSZRfSHCempKdCnBbaj7PEM0Q3TprA+8jnVLUMiQJOJogZxf66Hdf6dzs
	 h8B+gK482dvOVouOKuReUe8VgEkkG93g0sc7N7JuFC5uVYvKm0FHhrbYNUS3vb59DR
	 MsAYcfwG4vt3RmikrvoVBU6vj38IH5tk9SzqGEhECjn0JPoqwDcUjbNw7kmeBdtPpX
	 O98D9V0+vselA==
From: Benjamin Tissoires <bentiss@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>, Jiri Kosina <jikos@kernel.org>, 
 Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <20240604-md-hid-letsketch-v1-1-ff38ae7b4cb0@quicinc.com>
References: <20240604-md-hid-letsketch-v1-1-ff38ae7b4cb0@quicinc.com>
Subject: Re: [PATCH] HID: letsketch: add missing MODULE_DESCRIPTION() macro
Message-Id: <171766410042.2923458.12642644571213936867.b4-ty@kernel.org>
Date: Thu, 06 Jun 2024 10:55:00 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4

On Tue, 04 Jun 2024 07:20:47 -0700, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-letsketch.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> 

Applied to hid/hid.git (for-6.11/module-description), thanks!

[1/1] HID: letsketch: add missing MODULE_DESCRIPTION() macro
      https://git.kernel.org/hid/hid/c/fae5d8433db2

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


