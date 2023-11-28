Return-Path: <linux-input+bounces-271-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1E57FAFFD
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 03:16:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89045281B5E
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 02:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E8B84A33;
	Tue, 28 Nov 2023 02:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="ZW2nkU83"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4763C3
	for <linux-input@vger.kernel.org>; Mon, 27 Nov 2023 18:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1701137790; x=1701396990;
	bh=xMK98BjzCiilBY7AywmUE609Wi5vISxDEAU13hjmP2Y=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ZW2nkU83nuwO5jyZeLkopZ331T0I971E4ps4A0vjniiZh9axYt1W3juaAzS+mkSpe
	 xqxJQd4mi5lNfvMIDK1+z/h3LmYdbSmIN3p7Ryu7YdsCS3P9gfBUXlTVHqsv+MLOaN
	 4c7qofXUTct+MP5YNpK3izOUGIowph60Ca9NQgogZqfdLv134YcrMTCF5WYXbcKwP3
	 /eUe/SR870QgOTOvQ72dIXJW4c9Gmu3GOyG0dScgKJUU8BBshAutToiS0+ItAySzKz
	 NqCNNcP4I0nhcPhXuKTQgQAJUxmYE+OwTkKKr7WljC13CTAGmn8EERA6WT5FDqa3B6
	 r7dly0ypBnivw==
Date: Tue, 28 Nov 2023 02:16:27 +0000
To: Alexander Koskovich <AKoskovich@pm.me>
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: roderick.colenbrander@sony.com, jikos@kernel.org, benjamin.tissoires@redhat.com, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] hid-playstation: Fix button maps for the DualSense Edge controller
Message-ID: <87bkbeei6g.fsf@protonmail.com>
In-Reply-To: <20231126001544.747151-1-akoskovich@pm.me>
References: <20231126001544.747151-1-akoskovich@pm.me>
Feedback-ID: 26003777:user:proton
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun, 26 Nov, 2023 00:15:49 +0000 "Alexander Koskovich" <AKoskovich@pm.me=
> wrote:
> This brings functionality of the DualSense Edge controller inline
> with the stock PS5 controller.
>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Will provide a follow-up to the relevant discussion.

  https://lore.kernel.org/linux-input/P8jVfYBAwiM_8MIgshN0osVVfshfBH2-oZCQu=
qoqh0Hy76_031zuZvYXWl0edtfTUwDOSNlc5priSRXI3G5dboVh5VPbcdxzAcEF7EvUVgo=3D@p=
rotonmail.com/T/#t

Since I assume this patch was not actually tested to resolve the issue
based on the evtest results, I think we should drop this patch. Will
mention some details I might have with regards to the behavior you are
seeing with Steam/Proton specifically.

--
Thanks,

Rahul Rameshbabu


