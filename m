Return-Path: <linux-input+bounces-5689-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 262E39575C5
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 22:37:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D64842832DA
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 20:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9871591F1;
	Mon, 19 Aug 2024 20:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GKTiL1r+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5598F158A36;
	Mon, 19 Aug 2024 20:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724099839; cv=none; b=cGmNfDHBkvUYHTQsCQZl8ngNW1gPU1BSHiQDrBfeIVyp6b2tMbUppexnHw+GcvRk14H6H0ltFIzmkpeS32SyVGZzhy4ipRpG/MyEgWYzr6Ya0H7ZxM4rPapYK6S5Lbw0MUBgkk2zIzMbw7uhOnZcxxGovVf5vhhla4a5vi5XNOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724099839; c=relaxed/simple;
	bh=7z8d91YrvgxQaMULdUtcHYQN2HqO7YxpK3z0geHkvR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FW8XR7JdCikopDk2CuIMEI2Q8WecIVDGUB7PG7CC7qvz8Ij89+/0a/lH1CaFcdR8weeAzIqHXFLVGx0fMwsz3stDhJQHt40aPe4922krgSYV3erKsHHteVBtmlV+pfK/+DCYQbw4W0rqLbdkkt0KhzeUr2Jqj9h3QUIIdEKSkm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GKTiL1r+; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a7ac469e4c4so819074666b.0;
        Mon, 19 Aug 2024 13:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724099836; x=1724704636; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7z8d91YrvgxQaMULdUtcHYQN2HqO7YxpK3z0geHkvR4=;
        b=GKTiL1r+7iKT/pqbGON49JA2OV4j3pyaPw5c6wJIrK7ZdzI0gL7O82RDIoC1NsZJVl
         2n2MjQQOg6cNH+ELdNwi3LGsfIQEFNeObikFpb59AyiOROyNzuka2kM6DiuhcUnaYmG+
         1iYjah5z2GRAYB6+QAwo+ywsSzewzPS76yPSXCb0QQbOkJj9aVPdbS0z9QFZVjiLk+T/
         eHwS08lV30QKBPvO3v1VKw0Kin9ORvh6GLXbW6/xnmp4+Rceod0L9apagUhFBWGVgxFE
         4e05PhIPSWgla6nCMh+c+1VcSTVJk8mRmUeBCLneS1YJEVB2rBg9QjcvgieKFky2yMaZ
         WPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724099836; x=1724704636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7z8d91YrvgxQaMULdUtcHYQN2HqO7YxpK3z0geHkvR4=;
        b=uCULpmKGOGb6xivRle5CNlt0Evo2yE7gJ7Rb3WLMr3XMvXQ23psnZXX4dE9BvbgqOo
         Z98VADBouYN09wwqH9UOqnTMbpO48NGe240CIYw7F9AGbnpkedicFhbDLTpS+0vWFeaa
         jANRbWBnOV7nfNc53iMOICIPADSkGTaJ4KyRoDAElvuk+3P2xUrss62GVYZAsGDv4bm2
         awtTCdsX/dFoQHCQfxKYTG48/DybUvPECYLn0cGvxIXOcXmn7tzVztaFXYAMiK6xG8sG
         8vfU0uNMsOU8UAEv2bbzPJCg4bG1Hj57KhG6rFXngts5PCTGDOoDGOo3KFkFEUjltgQq
         esFA==
X-Forwarded-Encrypted: i=1; AJvYcCVgVgHhv8+zhkFM9BSOtErzPcgp/y/POJ8+bVLNWGeNS/cl6V7GpiqnWRNbTHLNiXG9VitE3I39vjvqXvhCgYew6SaEK8tQKG2I0DNG0TEbPXE2/HEDW/6cHBT4XHfpL2QQvx0Af7XF0Tw=
X-Gm-Message-State: AOJu0YzvWyahLmOu3l+hEtdaf9hnumYVTATCSMeGHclJwRoXufdhZKIO
	opLwN1qp0O2ESm5LJ0GsYuWQNmIKpIZoI7pVZ+zHBE23gaIZX3fm5z9LnjFl3YSlTpn2hWXYfIv
	YTC1Rw/M5B+QIV157iq1G4Zn5FHc=
X-Google-Smtp-Source: AGHT+IFFpUTVn4+PPnRHuyo1iJNs8JfNZw4sqYsVL+IKHL2bMHbb/sc0H05siYKmGjZI2mU830rBOFOmGoHspCVSmio=
X-Received: by 2002:a17:906:f58e:b0:a7a:afe8:1015 with SMTP id
 a640c23a62f3a-a864411705fmr68831466b.29.1724099836317; Mon, 19 Aug 2024
 13:37:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240811130906.3682-1-max@enpas.org> <CAEc3jaBELzAnffyE4mzQeNAiH-F5AhQqMGvMKoL6yu4naHBo+w@mail.gmail.com>
 <nycvar.YFH.7.76.2408192033080.12664@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2408192033080.12664@cbobk.fhfr.pm>
From: Roderick Colenbrander <thunderbird2k@gmail.com>
Date: Mon, 19 Aug 2024 13:37:04 -0700
Message-ID: <CAEc3jaD7vnU_SZYqyAja6LD_Zqwy6cpi+yWOW94tPt3UH6vGqA@mail.gmail.com>
Subject: Re: [PATCH v2] hid-playstation: DS4: Update rumble and lightbar together
To: Jiri Kosina <jikos@kernel.org>
Cc: Max Staudt <max@enpas.org>, Roderick Colenbrander <roderick.colenbrander@sony.com>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nathaniel.lewis@sony.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 11:33=E2=80=AFAM Jiri Kosina <jikos@kernel.org> wro=
te:
>
> On Wed, 14 Aug 2024, Roderick Colenbrander wrote:
>
> > Hi Max,
> >
> > That looks like a reasonable workaround. I think it would be fine to
> > add. We will try to support that with Android as well.
>
> Roderick, can I take this as your Acked-by:?

Consider it Acked-by.

> Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>

