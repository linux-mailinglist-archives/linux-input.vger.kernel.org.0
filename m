Return-Path: <linux-input+bounces-9195-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8804EA0B84C
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 14:37:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1418188645E
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 13:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3013223979C;
	Mon, 13 Jan 2025 13:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kcqc3TiQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645B31CAA8F;
	Mon, 13 Jan 2025 13:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736775403; cv=none; b=lMhs1ZrnW3XSXN55zXkJ7cBWIVyHUTfXxmNjw5MY0O61mJPSuYYpyw3XNL+ftGttHFblPxfHbU+bSXijh1V3xPnGP5CLK10h5g+tj6ME3qzh8kI+MQQZuSSotVU1eq1c2Ebe7vO3sreOipKzXPR6w6EsFrBvG77qQ84r3omX+iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736775403; c=relaxed/simple;
	bh=dVOX1ct04XRB6HS4XCM9AuU0WW15SibfodTKj6OCrFA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type; b=jnbwwk/yh1b+kbJKA91OkqIYvOAGaFVsSUp3Vq81U7tuS+2gzQJOXTk+vgNq9vKVrt8jnPl4Vr1eRc+RViTJ5jyxMY6F8iLyJg5AsQO8jhYj0pGuCXsckPpzgwaHesgka4HTkLtgJBSJgh6QAzY0AMTsp8KFTR+KvCyztQ6WHL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kcqc3TiQ; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d3e8f64d5dso8352006a12.3;
        Mon, 13 Jan 2025 05:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736775400; x=1737380200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BCOO3CeumWEhxRoRrsxtZPCsXRg2joLKXPxHQJ2qLzk=;
        b=Kcqc3TiQpGsFgrhUgJ92ZQ09uZvFAXzPQmQYDX8qDFe71X3cqH6/9xVcZhdQ5G2RbA
         SQIewa3Opy/75bKFpJgxIyESFVahGpkmhC61E7SNyVv9/rRu7vFjwOvDxOs4uBII30jt
         9it2PQ/K4mkTEJyPpWLW7ri6CA705ASfVSHUU3iU+GB7HeE7imjecvIUptFXbCh9DWYM
         1a4T/o0DrFVu/tqyiI689azMIMcKL9OB7fIT4fposP4Ox1BqekRpAiKLcJPrbZt7er5A
         gR1HheFZpyZYN/IVVhqB1EHs9eItXhfIHEW3/lrmSsFZU8y0uAEqsl28WEu0QKE7sYGM
         D4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736775400; x=1737380200;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCOO3CeumWEhxRoRrsxtZPCsXRg2joLKXPxHQJ2qLzk=;
        b=vqa6rUqLZ+iApwPyw0bfRRCMIdjQK+ExhPLnCI28kC1KREjJvUdui2AfoDbhYJ1stb
         G3ibCtYoXRPw2nQKcBG7EK50qKwEBPHbqPBskP8yIDMcjv9s5rrJCdNh7Pe9A3ir8NQ6
         xQGCzoddNOx5BcnEWA1b8xTnpub/nlL0KWBR72ynFQSY7Xm2pDyn67X8rPNtkW9PoI8A
         jqptf+q9FYm8cTOFHxdnJVhgFh3ROTmAm5WjOW8d2xH1WX+cxXfpIcGeJxWcMis5TqZ4
         Oci4vX5+giYqrJFy18/GU1KSFz8IUqfIo1AA1zKF48+EuwdSn1UrQmgC28XhUSS86wAh
         P7jw==
X-Forwarded-Encrypted: i=1; AJvYcCU/0hhyqO8d20+233YRUcvTbSx3WfgzubN3KMQLwsRSEUGd3P+RC2AvhQBwzryLfryr+sBOfv6ktSC1i7439Q==@vger.kernel.org, AJvYcCUi1bl7rxRS5jawmo4NxMOJ+n/kcac40zB00ZkOAt3qs132PkELMB/uhvIlFEsfXLtY8GjTE0cBmwOM@vger.kernel.org, AJvYcCUwB90i0dNke9AQh9mjtj4pnR7nm69ogt83SOXi1XytwoSx9J2KBAZPHr++xYbBdx8KNW4lQxFuvlyTaCU=@vger.kernel.org, AJvYcCVDJg3RqeELTA3KiM7sVgGqvsQu6GDHuCexhw/k58I2HGfBbtEfo3gH8DG3Rcom6A6EvQoihmXhoFREVNO2@vger.kernel.org, AJvYcCVb9HAc50U0FiwttFmAolviET7D3yZHuuvO6BI2fZ8ilwhx262XocQLgaN69+WYBOD1EPR1m0/Ooofi/3U=@vger.kernel.org, AJvYcCVntDS7PHYGkj/R+mWgWYixV1EfdPoxGC80qLOY/DLWM9I6tVmu2l1/iH/Wk/2h67ht+1+PgQUFxUG1@vger.kernel.org, AJvYcCXuBa336J4wJNbjbFT7fkfj5Z5uBEViZkvyjKmEVIcqnjIXsdpDnIZx1SgTC80OqjI3L+rRa+znmStg@vger.kernel.org
X-Gm-Message-State: AOJu0YyKlBI56hZDmUWMAPFaintn4KxgkRyMyB7Pc3zg31Fz8sKm00FN
	zjBEzY67S44o0RLX88bc0851rEKMHQJ6CVMgsgOekQHRqwoZ04Ch
X-Gm-Gg: ASbGncvObGdv2RbvdknOuhISnXPS5Szh65g5RuVRNB/4iju6ZO3Hj/pHcItCAVeMKMx
	++m4+4ZJuISwjY9/wZuWcUX23fd3Wq/XmNT4I/GYRlTgn3m1zN+00beK0Q55meAI8lSOv0n0W8M
	BnnL4YdLKAG/6P+BXqfbGTBN0JwV1LNXx1KEkC7EfSagmL0bXYsRVd6uVSePxn3O8Qemk+RkjIH
	fEvgf1OvtaJhqbjF5JPll1r3z4QZYKMjqUbLXHmWQFJpUYTHQ2tq5Si585lSsK5nhLAefk=
X-Google-Smtp-Source: AGHT+IFjst6wsdjTPwp6oiIf+Y1R9oxN/d9Kg2WINuDvWnvcQG61H8vLN/Y+6oQgF/w1Z8cqOc3BsA==
X-Received: by 2002:a05:6402:4023:b0:5d0:e2c8:dc8d with SMTP id 4fb4d7f45d1cf-5d972e1b962mr18696919a12.20.1736775399331;
        Mon, 13 Jan 2025 05:36:39 -0800 (PST)
Received: from foxbook (adqh85.neoplus.adsl.tpnet.pl. [79.185.141.85])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99008c2ccsm4986793a12.18.2025.01.13.05.36.37
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jan 2025 05:36:39 -0800 (PST)
Date: Mon, 13 Jan 2025 14:36:32 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: quic_wcheng@quicinc.com
Cc: Thinh.Nguyen@synopsys.com, broonie@kernel.org, conor+dt@kernel.org,
 corbet@lwn.net, devicetree@vger.kernel.org, dmitry.torokhov@gmail.com,
 gregkh@linuxfoundation.org, krzk+dt@kernel.org, lgirdwood@gmail.com,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 mathias.nyman@intel.com, perex@perex.cz,
 pierre-louis.bossart@linux.intel.com, robh@kernel.org,
 srinivas.kandagatla@linaro.org, tiwai@suse.com
Subject: Re: [PATCH v32 01/32] usb: host: xhci: Repurpose event handler for
 skipping interrupter events
Message-ID: <20250113143632.63c52d74@foxbook>
In-Reply-To: <20250108012213.1659364-2-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

> Depending on the interrupter use case, the OS may only be used to
> handle the interrupter event ring clean up.

What do you mean by "cleanup"? Because I see that this patch ends up
acknowledging events to the xHC and I don't know why it would do so?

> In these scenarios, event TRBs don't need to be handled by the OS,
> so introduce an xhci interrupter flag to tag if the events from an
> interrupter needs to be handled or not.

Right, and if the OS isn't handling those events because they are owned
by a coprocessor then it shouldn't be acknowledging them either, which
has the effect that the xHC considers their memory free for reuse.

Also, what happens when Linux goes to sleep and this IRQ stops running?
I expected that the coprocessor itself should be updating the xHC about
its own progress.

Is it a bug? How is this stuff supposed to work?

How are future developers supposed to know how it is supposed to work?
I imagine that few of them will have Qualcomm hardware for testing.


> static int xhci_handle_event_trb(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
> 				 union xhci_trb *event)
> {
> 	u32 trb_type;
> 
> +	/*
> +	 * Some interrupters do not need to handle event TRBs, as they may be
> +	 * managed by another entity, but rely on the OS to clean up.
> +	 */
> +	if (ir->skip_events)
> +		return 0;

This function is only called from one place so the caller could perform
this check and don't waste time calling it.

Regards,
Michalal

