Return-Path: <linux-input+bounces-4873-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D87B7928A6D
	for <lists+linux-input@lfdr.de>; Fri,  5 Jul 2024 16:13:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 159A91C21711
	for <lists+linux-input@lfdr.de>; Fri,  5 Jul 2024 14:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5E215216D;
	Fri,  5 Jul 2024 14:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nozomi.space header.i=@nozomi.space header.b="qB31pCTZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.nozomi.space (mail.nozomi.space [139.162.184.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B886A1494CC
	for <linux-input@vger.kernel.org>; Fri,  5 Jul 2024 14:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.162.184.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720188808; cv=none; b=H7STeOZnXPb5E90tLKc3DeRy/vONY4/1xaYUYx5D2qcioXC634vrSmNnQCF6b1di662ltYh3A4Ad1pbLTnq+NjwXF3nwSrdinwLFc1XbY7QKN9d021nrtIqb8dAzemRgSI4AiMC16dK48WgoYTeRc9j6k+G+eHDBkNp+MXCDi4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720188808; c=relaxed/simple;
	bh=7VLU64WkpkWL/qNjx5Zie3u5NNCsHKdlF5HSqylVTSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G8xiH5FPTJ5H5rSLAtiltF6VVcOzozbGbQ8zWHkPLnuO38gbzT/D8KOUCpdhrbnhVkj7+yo5waDM1zBjjwb5/K/WBpq+REa0wt1jWREebkJZeBxSWQ9wyWNTjORyIt0u7btlr8ubQYo6L52jrF+rWRfPubsV016qMDajq8kfg+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nozomi.space; spf=pass smtp.mailfrom=nozomi.space; dkim=pass (2048-bit key) header.d=nozomi.space header.i=@nozomi.space header.b=qB31pCTZ; arc=none smtp.client-ip=139.162.184.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nozomi.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nozomi.space
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nozomi.space;
	s=mail; t=1720188251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7VLU64WkpkWL/qNjx5Zie3u5NNCsHKdlF5HSqylVTSQ=;
	b=qB31pCTZv0JGjNhQfDLtAuiOKnWI/vz2Bx7HtfUcgKfKiCWJ0IPvMNrOCcK9ORsky9HIx7
	gOguIV0Ewth1k/QevFacnMf3ibCg47jQw5zHSoCnorXfJyLGkaL8EdnBY9SJSrzztM9rHH
	O+s3R64Dxag6J8argOSANfg6q8syZWVXbybUQ3ZWxBnNYNg8U8udH0HVfChIsixkOrX4mR
	dcV05HkWvIi0MXaJoTEkihfhuJyq0G9Bma4j7GMZAadHO0jsHEfqdLcYW7KqPiomhxUBoG
	BIyuqFCo8SCudCZx3VJ4x0m4fOaG84S0FkxI6kOQ9vNXPqlyKEfRKgvrhJPtXw==
To: tomasz.pakula.oficjalny@gmail.com
Cc: dmitry.torokhov@gmail.com,
	jikos@jikos.cz,
	benjamin.tissoires@redhat.com,
	linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: increase max button number to 0x3ff
Date: Fri,  5 Jul 2024 16:04:06 +0200
Message-ID: <20240705140408.142455-1-michal@nozomi.space>
In-Reply-To: <20240702114530.11800-1-tomasz.pakula.oficjalny@gmail.com>
References: <20240702114530.11800-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Do you have any guess as to where this old value came from?
It's weird that this wasn't caught already.

CCing some more maintainers to get some more eyes on this, I hope that's okay.


