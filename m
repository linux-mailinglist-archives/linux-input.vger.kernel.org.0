Return-Path: <linux-input+bounces-11982-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 59408A9AB4F
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 13:02:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9ADAE7A4604
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 11:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B58D91E1DE5;
	Thu, 24 Apr 2025 11:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IBf3Bm8S"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6F85BAF0;
	Thu, 24 Apr 2025 11:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745492544; cv=none; b=KXYpRrgw9Twd7vsr6CAv2mMg7xeTiw23cBfbZ59q1kM9t6TS1fQVsUmO+rE7W2oRdsEwOYaCSGOdIpewPFF7O8g/+wz/p+yQDCk6z4tvlvdRVW8tcaxFeAJD4PlaecXyXp7EGluBXKvcWx8e0kZVqi+X97cORI9Cajw6kyBwEhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745492544; c=relaxed/simple;
	bh=Y31huZTy0JsfYOW2OBig52J+szL/TvDRga6oAaTBo+s=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=L3imEJd1xzg2DhZqK0MX/rW1d7UyQycF2eVC1MuRDkv5DfBVN7dSKYnatXJDxMqWIJJQFidoetnf6hFL6B3KR/ACvc1avdY28IcbSpiv7ritZUfVUClIVJBkBDA4rhX2TdXfcRz4E4FeYqX2jIUrzelVKledaBg6RCipOFlsoqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IBf3Bm8S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66EC5C4CEE3;
	Thu, 24 Apr 2025 11:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745492544;
	bh=Y31huZTy0JsfYOW2OBig52J+szL/TvDRga6oAaTBo+s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IBf3Bm8S0HAcsSL/wQIgcXL2FTUCYR1hQJjr9Q0ETVuTSzG8l+VKYCtgcTPRK9hRb
	 OdMmiOwOEWKXmdE/W6qxY+a19eD4Vc5QIu1B8ndg5hnBus1ETvPyt2fBFGDT9bJ3dy
	 9M09KC6+MzoyRzrrxZ7ff4sPdKyKzWgvonnI+O2FEV8IB4eQLWmMweFKf/o64cIr8D
	 FOsHrwx64aj1vW8K0VKaeXIAAAKG/iCMiO4uphwjgfvEsz/UD5DtwC0HRu/PEOp8a4
	 8L/R7I5cQbs9iiDklGAage1GOLs9xGVRsa0j20uCLi+L7q0rlN0oo9cvre1rnkuC94
	 CwyqOxUXIvgHA==
Date: Thu, 24 Apr 2025 13:02:20 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: miltonials <miltonjosue2001@gmail.com>
cc: bentiss@kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: quirks: Add ADATA XPG alpha wireless mouse
 support
In-Reply-To: <20250409060428.1188-1-miltonjosue2001@gmail.com>
Message-ID: <89rpq7r8-or9p-76p1-o462-35q10666n816@xreary.bet>
References: <20250409060428.1188-1-miltonjosue2001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 9 Apr 2025, miltonials wrote:

> From: Milton Barrera <miltonjosue2001@gmail.com>
> 
> This patch adds HID_QUIRK_ALWAYS_POLL for the ADATA XPG wireless gaming 
> mouse (USB ID 125f:7505) and its USB dongle (USB ID 125f:7506). Without 
> this quirk, the device does not generate input events properly.
> 
> Signed-off-by: Milton Barrera <miltonjosue2001@gmail.com>

Applied, thank you.

-- 
Jiri Kosina
SUSE Labs


