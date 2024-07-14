Return-Path: <linux-input+bounces-5027-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BE99D9308C5
	for <lists+linux-input@lfdr.de>; Sun, 14 Jul 2024 08:15:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4564DB212B8
	for <lists+linux-input@lfdr.de>; Sun, 14 Jul 2024 06:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5766EF9F7;
	Sun, 14 Jul 2024 06:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iNksWJVb"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C5B28FA
	for <linux-input@vger.kernel.org>; Sun, 14 Jul 2024 06:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720937752; cv=none; b=IpNaSr8k08HP9hwomPAEkYGM2dFW4KeRXQGQZzEzZUQt8NSbsa6R0/T1keUDFwhVHFbTdCLEiJsGpc+RaYPlSTF5abZEGNkbWxZyQC5Ek2egr9/hoKl7Hs6UPtfiGnKnn90uAEAT+PN3VnsuYJTRBz9RRbDUZV0j7BfOu0sdn9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720937752; c=relaxed/simple;
	bh=RR7VMxNqnbokWkyX/KWzTZStlI5dneDufGMAQIDZkcA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MAYosX2TELQhaS80xRiX/3MVyPNhFFxWNr7Tqi+1TTD6L/eAUuU141T66TcQ1yJk54gC46zMHDnYNL/kVPOQpCFH1Jw63fiCI31a8fCnRJONecN3RuqARt22/d5b7k+wkmp4PZXuj12ZVL54DZqwKx6i1gNO7MmkUJKxNNEP5Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iNksWJVb; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a77b60cafecso396657166b.1
        for <linux-input@vger.kernel.org>; Sat, 13 Jul 2024 23:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720937749; x=1721542549; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RR7VMxNqnbokWkyX/KWzTZStlI5dneDufGMAQIDZkcA=;
        b=iNksWJVbc8swbtrmzPVCJIq2AFHA2EsECelBfuSFCrrlFUVK9zdI7MvIAAOAU1A7LE
         HLxQYjXWhFHmAyI+qLLJ3gzm+gVb6qnr4Q+uajSGOgRQDLNyNAE4jr96DelhC5Bg/rEo
         yztc7+6cIeaywjYsBCBr5bd34ZMvT77CMQV6UbhvrBdemlk/lpMlvbxNR1Q6svERVeYz
         jNE9kvfiujPVdsy6nlVSC4HBchVZ+/5vFtpPqtAagVkut068bU/VFMRnF7ZIFhUeh6ek
         725yOsZpHpkh5w8VhwCMUJRY0Y2RkEieTn7Jm2WWY2u4qEOVLJ3+TRRHT1OyxpQzwDOs
         M6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720937749; x=1721542549;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RR7VMxNqnbokWkyX/KWzTZStlI5dneDufGMAQIDZkcA=;
        b=boWc6DFt7r1rnPipsQXpRa0isnIbejtcOKwLw9kaVrfIXn5QES1FmCAVKYbVinME50
         RvP8uo1l/WIO7yS59uK2AnUxdpl60IHS/7N/aXxh8aM+W9A3Orf0bWfLi735Ds9FJR6W
         Y54p614r1PVeuixeDu9wYFjX2B/eD8jlfmI+FDk+G1piVoKNmk/BeA2ajFeVZgHsH7Pr
         1nxk8w1EkHBhPCbe+ODo5N5V6KkISUNNF7ZVJY7M6MaW/sqwf3kyyMRRe4QzsWvlEJO5
         CeiDpEK4MfA8UFsXKWEOMQIL6dEjRbJVvJ7NW2J4XuLZrgTY9TFsuNHr36sp/athYK/y
         jlRw==
X-Gm-Message-State: AOJu0YxmtElUYAtEVb2tL8z0qMNvOjSmVhlTupat6RuXmR/1V4GOjico
	QtZzKGFt+QrK7FlD8ukKAHehlccMTk0hkM2/3vU4u9Ns5/1I+1S9
X-Google-Smtp-Source: AGHT+IFXSSFzfJwAytDl8Mq+34B7a9UwTeyrVqNGtBju1e84QXAGW7+BSYsxySVxSUb3WOM3gWv35g==
X-Received: by 2002:a17:907:7da6:b0:a72:750d:ab08 with SMTP id a640c23a62f3a-a780b6881e1mr1274418866b.14.1720937748689;
        Sat, 13 Jul 2024 23:15:48 -0700 (PDT)
Received: from nsa.fritz.box ([2001:a61:359b:e801:d44:32b3:6924:10d1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc5a3965sm101582466b.42.2024.07.13.23.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jul 2024 23:15:48 -0700 (PDT)
Message-ID: <2cc00eb824ad5e72da10caa1303bb1caa1c7076f.camel@gmail.com>
Subject: Re: Should adp5589-keys driver be removed?
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Michael Hennerich
	 <michael.hennerich@analog.com>, Utsav Agarwal <utsav.agarwal@analog.com>
Cc: Linux Input <linux-input@vger.kernel.org>
Date: Sun, 14 Jul 2024 08:15:47 +0200
In-Reply-To: <ZpNjZC4YbkCy38R1@google.com>
References: <ZpNjZC4YbkCy38R1@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2024-07-13 at 22:34 -0700, Dmitry Torokhov wrote:
> Hi Michael, Nuno, Utsav,
>=20
> I am looking at the adp5589-keys driver and it only supports
> configuration via platform data and there are no users of it in the
> mainline kernel. We should either remove it if it is no longer relevant,
> or change it to use generic device properties so that it can actually be
> used on modern systems.
>=20
> Please let me know.
>=20
> Thanks.
>=20

Hi Dmitry,

I think that driver is still relevant (Michael can better confirm it). I'll=
 do a
similar refactor as I did for the adp5588.

Please just bear in mind that with summer vacations and all of that it may =
take me a
bit longer to send a patchset but I'll definitely take care of it.

Thanks!
- Nuno S=C3=A1

