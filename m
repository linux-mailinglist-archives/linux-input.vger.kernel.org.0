Return-Path: <linux-input+bounces-9842-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C71DA2C38D
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 14:29:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 559F11883140
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 13:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49FB01E7C37;
	Fri,  7 Feb 2025 13:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bQ3KsrCc"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2540E4EB51
	for <linux-input@vger.kernel.org>; Fri,  7 Feb 2025 13:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738934972; cv=none; b=fc3oWLRwhlvbiaHOIsayPIyP9XZra7/PVbs3wI60w1a2gYfl1QKHjex1s3jR7+BF1U8gb+t3pSfj4GT7QoNt0tsPLqxMsdXsv2PWdLX3rNMEITnpwVhf72IMirTUG+SS9ILafbRzQOPJH2LXcx3wBicDmfXIVUpFqupbCVrpx0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738934972; c=relaxed/simple;
	bh=oFEDFCzq2ZdsV9/F0hzrSDpy0MIa2UJuyYsbwXvaIxo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=IUtLb2kIvo+wCnw81cftBCKSXbNP/J24HEmukv0DeK5AhUfSvCrrD/MmhuAxvzr1dTMjdfD8kRjMP1DVPrsr3ekXfmzbV36ZWi1sdfTmSE1OCTcDdzqQkc87kEfg7/k7efTgFrp3ubASvwZ/1fToVD2IfrX8xjDG09Rl+KVClok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bQ3KsrCc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD56C4CED6;
	Fri,  7 Feb 2025 13:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738934971;
	bh=oFEDFCzq2ZdsV9/F0hzrSDpy0MIa2UJuyYsbwXvaIxo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bQ3KsrCcN0LmPzJH1xPyxooewHS+k9BILv/uOvKrsl73DN02nkNjTFhmJxKIwoXrv
	 Gu1GVgFOHkbGy6o0fdWfzQdMmOOqQFT6lgWddHQ7XEyOUxQRTQrKbpQ6huzgJG0Ak2
	 0V9G9u6XvSVTQqb4t2FqyONwYS8w5N4PwbJuMOAqvyiia+/a3Pw8rzWeATrEWC/Loh
	 PPR2r/QDm7xR9ajMp/FHrDPltq7NHJeInXbE64QQ+YCugmJvyYwrXXrBKVUOTotIEP
	 t72+M+8JjV3V5GBiEFv1c8Coif7VhA0ECzcjPW0G5pOIjJCYfROKt8pFdOPEgr5dQJ
	 e1k4VQayeMZfg==
Date: Fri, 7 Feb 2025 14:29:28 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Vicki Pfau <vi@endrift.com>
cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    linux-input@vger.kernel.org
Subject: Re: [PATCH 3/3] hid-steam: Don't use cancel_delayed_work_sync in
 IRQ context
In-Reply-To: <20250205035529.1022143-3-vi@endrift.com>
Message-ID: <rqqs7417-5805-8906-282p-r7965r41142o@xreary.bet>
References: <20250205035529.1022143-1-vi@endrift.com> <20250205035529.1022143-3-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 4 Feb 2025, Vicki Pfau wrote:

> Lockdep reported that, as steam_do_deck_input_event is called from
> steam_raw_event inside of an IRQ context, it can lead to issues if that IRQ
> occurs while the work to be cancelled is running. By using cancel_delayed_work,
> this issue can be avoided. The exact ordering of the work and the event
> processing is not super important, so this is safe.
> 
> Signed-off-by: Vicki Pfau <vi@endrift.com>

Applied to hid.git#for-6.14/upstream-fixes. Thanks,

-- 
Jiri Kosina
SUSE Labs


