Return-Path: <linux-input+bounces-2821-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2DD899120
	for <lists+linux-input@lfdr.de>; Fri,  5 Apr 2024 00:18:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 906AC1C217EE
	for <lists+linux-input@lfdr.de>; Thu,  4 Apr 2024 22:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03D7413C3F8;
	Thu,  4 Apr 2024 22:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iNpgHmou"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E253D76
	for <linux-input@vger.kernel.org>; Thu,  4 Apr 2024 22:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712269080; cv=none; b=X+blHH1qhYCYDQiTDBbITsFeYubAiNjpixkupLhMmeAYRTaFN7rYXyfxVWVKI8tFkSlNULhTwiSO/2o46c5KBL7CtRVIQxq5JcGevZLYm5f4NTJbTpi8skiwoaIs3a1uindAPmo4e2+OEMEjxxP8OC/b7FMmuaU+8Gf7mePSzCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712269080; c=relaxed/simple;
	bh=RZPrq+xVDjiyzuvgmiC5bztMCL91wQIMW6JQhQhfvYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PRLyMX0UtL01JRG2nyazT1ZlPxC3IhNMif+WasPeYGDDfby30j2jkKwMbWSsPV8C1nlnpOMSGijcqbwrpCDEq9RV5xF3HJWeGnQ056wOdca5djs0UCJk56vG2rT4EJhIMdQ996cBvC6apK0/wssntQbDYgq8ar+rp95aI8DY+JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iNpgHmou; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-343cd12630aso614729f8f.1
        for <linux-input@vger.kernel.org>; Thu, 04 Apr 2024 15:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712269077; x=1712873877; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIW+Z3FuH4Tlrbj9QrjroPzWQnEb4hQ4AxEw1tDZfk4=;
        b=iNpgHmouikM3eS2bzDsViRnQPf4IYT0AntRq/pLUycBts1tEtNDBhLAHPWLbGGQuwD
         QJtB2nqOmcrDZKQqkypAxU9t8BXasLVzM76U6doxh0UD6M0mrI/XgijigKuOcMI2NCIb
         whmis5i9jCy0XZKIvDNYWGW+znPQeHBEMsfX8rggozuXIuCHf0B+o1YIbhjdkYuLbC6k
         nmWR9tyq0QFPwh7UUDhI4p73EwefaEhKQVvrdC/li4M77bvJ/3+wYenQP3FJrzs+WVyB
         h/Tam1ckIRELByLvoQC8mEYZ6O8sMXwbWpK4qyuHRrWaDSukD/B1KlHnI6ojMiGvDvbK
         uIeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712269077; x=1712873877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eIW+Z3FuH4Tlrbj9QrjroPzWQnEb4hQ4AxEw1tDZfk4=;
        b=BpWuomRLdypiz/Hm0KBmmITli/DBooTXfufnZGMGp34/NmUm7sfLn+1obimny6OxDN
         Xs2l95dkoi1GrZ6uRKs/P8xgQLyvsk7wB3BbcqRqhZ67t/HB2OvfHD2he1qga83PNQx1
         jzKAavmSKkUShAxPA+uS6LTu4lYlEOmeORBGGT/nigOV6hGkrXchiv8+5/4Q8AnIZsPe
         hgFxZfwoNuyKUGIR1IU1QHV7YfPWM53fte9+L0G/1Qnspuz8JXcUXiMUsCiYjbG31TS6
         PlRFNaAn7jRjGAtMDroIMZr3YjgjGyki/RkqbHkgeWBdPRTef+lkGM1OH9qqRP3QJm+A
         +CLA==
X-Forwarded-Encrypted: i=1; AJvYcCWiSPLlrpA8EQAkYIctvQQEeu3+zUp2lhu7DYuSKfawfrSH28Hxl1JoGxsj041KORDrmBcKZtxFpGk2CU7LOtviN/iAkiMkRpOFfI8=
X-Gm-Message-State: AOJu0Yz7GtcOsKB53DXtNf5IWRihPXjxxbHvd9jc4bBs8TLvgnhChnYZ
	D+wpRVM59bPhl0Pr6DlGdO69PYBPB7nLTLL6bc8m0uWOe3HDtYFs4/47LuWeMAHOJKxzD5xn7Ri
	lm4cpuKhHGCnGtPQww6QmoxbJFpJAxB1q9XRv
X-Google-Smtp-Source: AGHT+IEoGycg7Q6yz1U10yVcrqSmmGhsvl59dTKCzdbY+AGkKJwTyJBRF58S2bqCqewHCyhhbzL+kREAY0nZt0Z/KC8=
X-Received: by 2002:a5d:56cd:0:b0:343:a117:7d2 with SMTP id
 m13-20020a5d56cd000000b00343a11707d2mr434133wrw.71.1712269077043; Thu, 04 Apr
 2024 15:17:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240404165404.3805498-1-surenb@google.com> <Zg7dmp5VJkm1nLRM@casper.infradead.org>
 <CAJuCfpHbTCwDERz+Hh+aLZzNdtSFKA+Q7sW-xzvmFmtyHCqROg@mail.gmail.com>
In-Reply-To: <CAJuCfpHbTCwDERz+Hh+aLZzNdtSFKA+Q7sW-xzvmFmtyHCqROg@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 4 Apr 2024 15:17:43 -0700
Message-ID: <CAJuCfpHy5Xo76S7h9rEuA3cQ1pVqurL=wmtQ2cx9-xN1aa_C_A@mail.gmail.com>
Subject: Re: [PATCH 1/1] mm: change inlined allocation helpers to account at
 the call site
To: Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, joro@8bytes.org, will@kernel.org, 
	trond.myklebust@hammerspace.com, anna@kernel.org, arnd@arndb.de, 
	herbert@gondor.apana.org.au, davem@davemloft.net, jikos@kernel.org, 
	benjamin.tissoires@redhat.com, tytso@mit.edu, jack@suse.com, 
	dennis@kernel.org, tj@kernel.org, cl@linux.com, jakub@cloudflare.com, 
	penberg@kernel.org, rientjes@google.com, iamjoonsoo.kim@lge.com, 
	vbabka@suse.cz, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-nfs@vger.kernel.org, linux-acpi@vger.kernel.org, 
	acpica-devel@lists.linux.dev, linux-arch@vger.kernel.org, 
	linux-crypto@vger.kernel.org, bpf@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-ext4@vger.kernel.org, linux-mm@kvack.org, 
	netdev@vger.kernel.org, linux-security-module@vger.kernel.org, 
	kent.overstreet@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 4, 2024 at 10:08=E2=80=AFAM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Thu, Apr 4, 2024 at 10:04=E2=80=AFAM Matthew Wilcox <willy@infradead.o=
rg> wrote:
> >
> > On Thu, Apr 04, 2024 at 09:54:04AM -0700, Suren Baghdasaryan wrote:
> > > +++ b/include/linux/dma-fence-chain.h
> > > @@ -86,10 +86,7 @@ dma_fence_chain_contained(struct dma_fence *fence)
> > >   *
> > >   * Returns a new struct dma_fence_chain object or NULL on failure.
> > >   */
> > > -static inline struct dma_fence_chain *dma_fence_chain_alloc(void)
> > > -{
> > > -     return kmalloc(sizeof(struct dma_fence_chain), GFP_KERNEL);
> > > -};
> > > +#define dma_fence_chain_alloc()      kmalloc(sizeof(struct dma_fence=
_chain), GFP_KERNEL)
> >
> > You've removed some typesafety here.  Before, if I wrote:
> >
> >         struct page *page =3D dma_fence_chain_alloc();
> >
> > the compiler would warn me that I've done something stupid.  Now it
> > can't tell.  Suggest perhaps:
> >
> > #define dma_fence_chain_alloc()                                        =
   \
> >         (struct dma_fence_chain *)kmalloc(sizeof(struct dma_fence_chain=
), \
> >                                                 GFP_KERNEL)
> >
> > but maybe there's a better way of doing that.  There are a few other
> > occurrences of the same problem in this monster patch.
>
> Got your point.

Ironically, checkpatch generates warnings for these type casts:

WARNING: unnecessary cast may hide bugs, see
http://c-faq.com/malloc/mallocnocast.html
#425: FILE: include/linux/dma-fence-chain.h:90:
+ ((struct dma_fence_chain *)kmalloc(sizeof(struct dma_fence_chain),
GFP_KERNEL))

I guess I can safely ignore them in this case (since we cast to the
expected type)?

>
> >
> > > +++ b/include/linux/hid_bpf.h
> > > @@ -149,10 +149,7 @@ static inline int hid_bpf_connect_device(struct =
hid_device *hdev) { return 0; }
> > >  static inline void hid_bpf_disconnect_device(struct hid_device *hdev=
) {}
> > >  static inline void hid_bpf_destroy_device(struct hid_device *hid) {}
> > >  static inline void hid_bpf_device_init(struct hid_device *hid) {}
> > > -static inline u8 *call_hid_bpf_rdesc_fixup(struct hid_device *hdev, =
u8 *rdesc, unsigned int *size)
> > > -{
> > > -     return kmemdup(rdesc, *size, GFP_KERNEL);
> > > -}
> > > +#define call_hid_bpf_rdesc_fixup(_hdev, _rdesc, _size) kmemdup(_rdes=
c, *(_size), GFP_KERNEL)
> >
> > here
> >
> > > -static inline handle_t *jbd2_alloc_handle(gfp_t gfp_flags)
> > > -{
> > > -     return kmem_cache_zalloc(jbd2_handle_cache, gfp_flags);
> > > -}
> > > +#define jbd2_alloc_handle(_gfp_flags)        kmem_cache_zalloc(jbd2_=
handle_cache, _gfp_flags)
> >
> > here
> >
> > > +++ b/include/linux/skmsg.h
> > > @@ -410,11 +410,8 @@ void sk_psock_stop_verdict(struct sock *sk, stru=
ct sk_psock *psock);
> > >  int sk_psock_msg_verdict(struct sock *sk, struct sk_psock *psock,
> > >                        struct sk_msg *msg);
> > >
> > > -static inline struct sk_psock_link *sk_psock_init_link(void)
> > > -{
> > > -     return kzalloc(sizeof(struct sk_psock_link),
> > > -                    GFP_ATOMIC | __GFP_NOWARN);
> > > -}
> > > +#define sk_psock_init_link() \
> > > +             kzalloc(sizeof(struct sk_psock_link), GFP_ATOMIC | __GF=
P_NOWARN)
> >
> > here
> >
> > ... I kind of gave up at this point.  You'll want to audit for yourself
> > anyway ;-)
>
> Yes, I'll go over it and will make the required changes. Thanks for
> looking into it!
> Suren.

