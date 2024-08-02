Return-Path: <linux-input+bounces-5286-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B757945CB5
	for <lists+linux-input@lfdr.de>; Fri,  2 Aug 2024 13:00:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5F611F22099
	for <lists+linux-input@lfdr.de>; Fri,  2 Aug 2024 11:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB9614B96D;
	Fri,  2 Aug 2024 11:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BujMVZY3"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482E214A4E0
	for <linux-input@vger.kernel.org>; Fri,  2 Aug 2024 11:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722596446; cv=none; b=iN8ndh/i+PywDiLDesSXOYPQQcebJ+CbHB5TRqRcfWm9WvvleA50v2MY5GNTnLDF6psXFVgsmC0lA71zCo5JoDZCuFuI7OPx/4EZSBDtfey1np2c5f+VytxIj6k1GcU0baRJJoig8B3Wi/438KppR7mkp+VULjeYUhLpVInBK5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722596446; c=relaxed/simple;
	bh=iLJ/fO6Pu09JC77x3FMnIDDwCs2uA2uLEk45JJK8gMA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ChVj+7F6VZOkJiZYMhPi+f1e6T45ik261iZS9DkVjLuVgCMxG4zrr430gtIgEcRnClUJlov1ZSxtgB24rhCXV0JyMz0RFS08r6nJd0CrvDf/c5Dc7sAIz86oMKhHhZpfl6BLx7tWMgEEEO6wsTSi2S04T4rYgMiYWoRmEfo9I7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BujMVZY3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8943BC32782;
	Fri,  2 Aug 2024 11:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722596445;
	bh=iLJ/fO6Pu09JC77x3FMnIDDwCs2uA2uLEk45JJK8gMA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BujMVZY3pS9WWHwzKMVt/j1b5zyqy1nCYTd4kyc59zHIvKSLIMZ1rbuQ3E6Kc5L3X
	 J5/FVD0cNprk0/gwmvUSVlBjaEXY8+0GyCoj6CcZIlEkie1bXJnWZ8aXT52gjlpyF+
	 vCwjdueAOLWhankBrpkiWkuyXPk8bPTLQPjc2TvV1mxTpKfkFXiBams9SFUfkSeyjR
	 kb5YF1d1vMF/rUjJbKpHL+4IdxBjJ1WavQYBujcSsVrk5l8rdoZx5DEy1swXoFWK8I
	 OVzXr3lyc9skMhlJf4dOpctSWEMdEJ9+dX7ZTxPaWkK+GUTzFhMJw0escbFGDiDckF
	 5EeolYhILoONg==
Date: Fri, 2 Aug 2024 13:00:43 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Dmitry Savin <envelsavinds@gmail.com>
cc: bentiss@kernel.org, linux-input@vger.kernel.org, terry.wong2@yahoo.com
Subject: Re: [PATCH 1/1] HID: multitouch: Add support for GT7868Q
In-Reply-To: <20240716222757.22931-2-envelsavinds@gmail.com>
Message-ID: <nycvar.YFH.7.76.2408021300340.12664@cbobk.fhfr.pm>
References: <20240716222757.22931-1-envelsavinds@gmail.com> <20240716222757.22931-2-envelsavinds@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 16 Jul 2024, Dmitry Savin wrote:

> GT7868Q has incorrect data in the report and needs a fixup.
> The change enables haptic touchpad on Lenovo ThinkBook 13x Gen 4
> and has been tested on the device.
> 
> Signed-off-by: Dmitry Savin <envelsavinds@gmail.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


