Return-Path: <linux-input+bounces-4201-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 256C5900557
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 15:44:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9A9428B0F4
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 13:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B74C847A6B;
	Fri,  7 Jun 2024 13:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J9OPinjV"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9363E1E4A6
	for <linux-input@vger.kernel.org>; Fri,  7 Jun 2024 13:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717767867; cv=none; b=YVob7q5dqfTexUkb7AoFA06GCMR5NCMEtJzfAdBEISHW8rLTfnEeKh9fD8h/5H0t66AAq7rhPliut0r2j9wFXpWlPqqf3O9iULoD2CvWz3YDQwSFwzThPyW0ygDW6Wk67A/y+XJ8jYPz0gqLo3MwgMVK2mnlbAOnJGE+Cv0f/iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717767867; c=relaxed/simple;
	bh=VwQst4s0P3RLNQOpwxddX1f9GYKbCsHFj/GGfRqjIDY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=H+xN/l0m0Ql0IbXsqcnDNYcRbc+dBrETu8xAigD/I9BIwvqlP8CRiTc/8ijJFCak1+PuTza10BKsUpks4tYiuvlrYGoN7bzcVZYkBv3BuDybrfHn8AYexmztlnOLTGXNlKv+U19S6yLTdY4iKBYyFhzabmhAAwawNIC9mfOa72c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J9OPinjV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BED4FC2BBFC;
	Fri,  7 Jun 2024 13:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717767867;
	bh=VwQst4s0P3RLNQOpwxddX1f9GYKbCsHFj/GGfRqjIDY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=J9OPinjVhgf58A3I90NZZ1wrM6Gjna1gaWAR+/0f9wSF9PH8XETjMq92cuVHE7p1E
	 UbQQLqgquwf36dbgOwI6DWlQHFIOo/VmGTO55UQpErzvOMYaqESRezMCtvl/qifOPv
	 1qHJ9lnQg22LGpPFIV3x7Vpd24NRQTxDNYZSAEIEFMfPFIEMcpuORl7i69V/8hcFRD
	 qZp8I7NwVSxwpu2l8CBU4GwV+LcdHRgFbVyG1chOykvYNHX9AK/DzWyJyWn+LiWtru
	 fA/wKINuhUPyVq4JhHmQu6sWNwDrxYROwpIEtgOeq+GYOdmcYlYg0aL2RILqLALtTw
	 yyxMNmYgb2h5g==
Date: Fri, 7 Jun 2024 15:44:23 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Louis Dalibard <louis.dalibard@gmail.com>
cc: linux-input@vger.kernel.org, bentiss@kernel.org
Subject: Re: [PATCH] HID: Ignore battery for ELAN touchscreens 2F2C and 4116
 on ASUS Zenbook 14 OLED (2023) and ASUS Zenbook Pro 14 OLED (2023)
In-Reply-To: <12465690.O9o76ZdvQC@yuki-p>
Message-ID: <nycvar.YFH.7.76.2406071544030.24940@cbobk.fhfr.pm>
References: <2747286.mvXUDI8C0e@yuki-p> <12465690.O9o76ZdvQC@yuki-p>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 7 Jun 2024, Louis Dalibard wrote:

> Hello!
> Is the whitespace damage still an issue on the latest email?

Hi Louis,

unfortunately it is. All of the incarnations look pretty much the same :)

-- 
Jiri Kosina
SUSE Labs


