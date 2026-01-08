Return-Path: <linux-input+bounces-16858-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D613D00B32
	for <lists+linux-input@lfdr.de>; Thu, 08 Jan 2026 03:40:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2CA13055744
	for <lists+linux-input@lfdr.de>; Thu,  8 Jan 2026 02:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 692EB2C21F2;
	Thu,  8 Jan 2026 02:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MDTf5oIX"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0AF29B76F
	for <linux-input@vger.kernel.org>; Thu,  8 Jan 2026 02:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767839217; cv=none; b=fMGO6D+DJ8jBdgjk9mS0cOyElMD5UIDSNa/k1s/IQmBRFvJ+lAhr8nuzz/pl7/P5vFoe/ilr3c6m0J+kTgZcQngvN+LRRMTSvKLQr7xgTVCQSs76+ZbDIr4D3w2D0iKzXHOQMKKsrkt9KRR78Rre/Vpm6EIEhHIsYDgl4CKnRkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767839217; c=relaxed/simple;
	bh=KWZZv1BQt+Z+F6V7wM6tmxj/xf27l4eykAm8PwFK978=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RM1Le7IcXUKZzYdkORvXUPvb8dIji0YjIUVNhGDCE6N7Pke/cuOUIarEbjfRBBXWIllWWt3FtLQYy8/BEv6bADzphjveVfR08Br+PdkyU/sWag4YxYA+KJt+B+dcceX4GzKTu4a+DknloBVBmqlXqX66UcJgyfHqKpyZHtbbh7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MDTf5oIX; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-598f81d090cso2742208e87.2
        for <linux-input@vger.kernel.org>; Wed, 07 Jan 2026 18:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767839213; x=1768444013; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=094/5dtQP8+a+PskAvgq1CpU/l6tgoUM9PsjNOTAIqk=;
        b=MDTf5oIXTAmVA5cSywD8ouBNQsmBQ68jG4ueRlzoF+nxyTf8oXuETchaZNQCU2KlPt
         Ygks8L9f6s5sg7DWkNF/Gu2xiM5DeGNmq9ps9NRnntGDgYTdqfstB8dHdmX/hUeZ5KrZ
         kQRWndsBNtkGn763lporJGYqoE1xIQFVogSlf3S0h6AiBqAE7yW4sIk4odpQguStz3K+
         nVCOcZtCbbFUIef1ZT1UJ2G8WthLnr1KxVuuQvKgwtPDHW5o+KBk2zf3X8lZtxleZY8S
         Q5mfLXVJSequjMREZBzhUHuLiWNEKr2FSmHbygyachGGboECxTj4sJ8uG26tub6JJUQ5
         bH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767839213; x=1768444013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=094/5dtQP8+a+PskAvgq1CpU/l6tgoUM9PsjNOTAIqk=;
        b=RwS6nyacPuS4B1u2IB1GHNZ5fCKaGba+ePAoYgdhjiVnNZYMgQpXSydFCDxrj2/6zx
         Wf2BamjkcA+dpgR0Rv0XretCT9dEBzIlF00mo9NfvXIe4tTqqdo/Ztk0771CBiI4+TlQ
         IsKx8XxHgT0NqYpR1naHLKei7+6UK67BcT9bZcAzoecsirvn6S4xM4VKysgBC1uctkr+
         f4pBaaBT0yeMohSPalU5KMMFWH4UrPAp4OZNOqk2kD24kGMIXUlqp8pbqdwHDLvYbg9C
         /5v9KczmkwOfupMO/g8bNlzaJ9Lufg+ZboYcPc/1g79BV/x4yz2nrYUCAnxOizLIYf0G
         Ns1A==
X-Forwarded-Encrypted: i=1; AJvYcCUO4DBKuGw+gIyjzNw73heNxGYrnjgMnPr4UgxdNJBtirtTyaAxs3r3d/ftTV0MNDidT3XbjLM1AT+/Bw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7dNmiLJ0nnmO9XhJLwpYPGPnU9UmwHJoeE2mMQT5iRk6QCqIQ
	ziX26OJF1bk33+vMxYhz5D4FfqtD2V545hTaOG1NV01ritwsr1CPNCiRK5UY6371/J3Zgue6Mvv
	DB9Nzb4Xw+S/QfzRazNXPhJwDEzGQ2WM=
X-Gm-Gg: AY/fxX7UeUovTUI3p9phUBLFfPgMeaER2+QzfIqJBorHjhu61B55XuZZUM8mpU+B3jR
	ym18satHURqfMdnovmjAf4z3QX4R4ho7DoHJp9EUqInZxCnvwPvj+cUsvTQh+Z8OJNWl79CRNhN
	KOvRaCeqvJgLmVbhBPVDtSOgaJRfAVhn++VIyIlznFx1blnPGb3eq/+dfGc7+UcrGBaqrEuxJqa
	38oo2ZNmnna/tuU5pTV53E25gapZp7OkV8Y++GxAJ57a9zUqjCs53ZdhpT2M8Cg2hTK
X-Google-Smtp-Source: AGHT+IGTiAhHfGo82U3FLSG0Akrl+JtcZFd1jQlu35i3v0e7LedXi4rktu4cXT0E5NPwChR299DbhB7Obz7fY0/NA2A=
X-Received: by 2002:a05:6512:3c8f:b0:59b:7178:15bb with SMTP id
 2adb3069b0e04-59b71781b06mr1220900e87.17.1767839213010; Wed, 07 Jan 2026
 18:26:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222080512.956519-1-vishnuocv@gmail.com> <5n18nonr-5292-60sr-2634-0q0r870n3oq8@xreary.bet>
In-Reply-To: <5n18nonr-5292-60sr-2634-0q0r870n3oq8@xreary.bet>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Thu, 8 Jan 2026 11:26:16 +0900
X-Gm-Features: AQt7F2q-JuPpMNDYUQVjIiRx0DBdFTrkljybmsM1__upp-BjSTrUTz72NlNB0O4
Message-ID: <CABxCQKuh1+gzm7d38bBaf2WWm2iyfeTv4+zJAqST3PE-KtnfkQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] HID: intel-ish-hid: loader: Add
 PRODUCT_FAMILY-based firmware matching
To: Jiri Kosina <jikos@kernel.org>
Cc: srinivas.pandruvada@linux.intel.com, bentiss@kernel.org, corbet@lwn.net, 
	vsankar@lenovo.com, linux-doc@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	Richie Roy Jayme <rjayme.jp@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jiri,

Thank you.


On Thu, Jan 8, 2026 at 6:06=E2=80=AFAM Jiri Kosina <jikos@kernel.org> wrote=
:
>
> On Mon, 22 Dec 2025, Vishnu Sankar wrote:
>
> > Add support for firmware filenames that include the CRC32 checksum of t=
he
> > DMI product_family field. Several OEMs ship ISH firmware variants share=
d
> > across a product family while product_name or product_sku may differ. T=
his
> > intermediate matching granularity reduces duplication and improves firm=
ware
> > selection for vendor-customized platforms.
> >
> > The newly supported filename forms are checked before existing patterns=
:
> >
> >   ish_${gen}_${vendor}_${family}_${name}_${sku}.bin
> >   ish_${gen}_${vendor}_${family}_${sku}.bin
> >   ish_${gen}_${vendor}_${family}_${name}.bin
> >   ish_${gen}_${vendor}_${family}.bin
> >
> > The legacy product_name/product_sku rules remain unchanged and continue
> > to provide fallback matching.
> >
> > ISH_FW_FILENAME_LEN_MAX is changed to 72 to accommodate the product_fam=
ily.
> >
> > Tested with X9 series and X1 series.
> >
> > Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> > Tested-by: Richie Roy Jayme <rjayme.jp@gmail.com>
> > Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
>
> Applied both to hid.git#for-6.20/intel-ish, thanks.
>
> --
> Jiri Kosina
> SUSE Labs
>


--=20

Regards,

      Vishnu Sankar
     +817015150407 (Japan)

