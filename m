Return-Path: <linux-input+bounces-16584-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E8813CBDF6D
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 14:15:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 488CF30596BE
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 13:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3C4D2D63E5;
	Mon, 15 Dec 2025 13:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kUuHb2Ii"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF342D7804
	for <linux-input@vger.kernel.org>; Mon, 15 Dec 2025 13:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765804170; cv=none; b=N8VrtBVqBCuPXIBu0UZOXv2UdbdpZBhIeCPAh6/ZVDh3DVKNlNTemuOpf8nDCG1LPJb7Pj+fbPyGW4kk94YoJq1YcyeW9K/fFzBnzJlDLO9NdH8Ss9QkK9Qa+GWwdGgKHVhlmBjoQOgnl13OBG7GaHSn41ngWF2w6d9Yu/YUP/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765804170; c=relaxed/simple;
	bh=htT2w6l3gT1BhEWxPoOuIIkxt113epopi+xlKxAqEYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PWj9Yu8pS6r9Zn9DiOpcu0/s6TC/Pa/PiGvHTgCDrHMgSDfx+LwYGnBnKo1gQxbTrBrorNy/BAmRMTgByilsXpQTblZky665OtfjDrPaXAP8snka2zrItOSqGlCleWqWCHLLm2Zay2d0hviU8Ir24P3hNFHY0VXW5Py/bR3KDi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kUuHb2Ii; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42fb2314f52so1519327f8f.0
        for <linux-input@vger.kernel.org>; Mon, 15 Dec 2025 05:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765804167; x=1766408967; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M4qyctUX7vU1W8pSxvEcJ1tR+43BtQPWPVTKPDH9E2M=;
        b=kUuHb2Iii/+nvVsTgYfmnyUmr8L+uuctEyISmztwpQ0FOxzrWqVLobOwWGV51mdAo6
         sXqc63B5fpkVJsG21fGHDOCDVepbkd3p25FCB6+XrMrSejdRMKD4I8ebCt8CQqi5uM9M
         i9csx2BVWoSGdri3pK1n/FXdiMukBplAVCf10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765804167; x=1766408967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4qyctUX7vU1W8pSxvEcJ1tR+43BtQPWPVTKPDH9E2M=;
        b=p0IbW8KID2i599TB0OGBBtRl7UTHmZVdg1m+KTTCoP7QG9Wel1bR2oAXxxxlvJYkVi
         Tv925x+9LkrM2IqwMTgcHuMQ+WWxs9jnhFzSMUjJxzd1SeJdhKNGfJ/OF3gwW7gflw+B
         hKwvZaDSDZ/F4CVX+k9zFb5xhhubRDclyM2GKEsUOJevjaTi2t6DxQhkdYfuKU3atc8v
         2IB4oeyhqEKxVH28pDssfkIxytmvAv6bywvDMibXfU2FANLl3fMsc01bapXQ8Y+3Vg2P
         BIQgnYNB06wlhwuG7Df+Y3Q3O4HkONGU4CwcILvv6pfwH18tHrCsRKJWQTKhiFuzMZNx
         IzvA==
X-Forwarded-Encrypted: i=1; AJvYcCU3/gAWnjj3aM4HVCgZ0N79HQ7IfE1YztV0lAqYPCfhR+g/7O0PIPNXAc2ABCVpx3HBKA99BCEANGq5nA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2wq5yjJLOYRaa0gFX/aRrcYRanuqIuRl5ooGAEqaPO5WGn+71
	OFRdWgltco6LhSOmdyZE1m26+nVSParnRLUCRmVif7NIkDHFUTXSbfLA7pf2S1Pv2w==
X-Gm-Gg: AY/fxX4RFOGykqNGD+b1KGWWjO+rWhIieHjmmffz0RtQsOoLOzf0361/Yq/POyOonef
	ckfbxB137sv7n3EqK4PxOyIMCSCCMGm247GxW0kSJyYdXg+Gl2jNurCWeiE5bkaFAusucpAI9FS
	TAgHFhRXsg62Q8lesLqfauFVRLPt+2RATy7/eilGg2nJq6lXgoX9VP2TnWj4MpD0meXJUCiwM+Y
	4ECwk12jJHGTC5dBsNQ8vsm7pfnnepCAMEqntv7Z2QUS5b12PKQSixdIkL49a/IOfg8Q9yooTK8
	ADJ7OwPLnQxpWoc/YJ2pSkerFst2CqywoRX/k8oplQodUpRz9Jt+6f1INxjxu3CaOgzD33m5aHZ
	fLspE9NdpTl07pYqIpKy1P1myqWYzNRjiIgLqoGuqXdoGNUepoctFAeA3PGwbW4/WxNesXp2Une
	sQq8+73SF4ORp6ckcXzA==
X-Google-Smtp-Source: AGHT+IHxUjIM6pOJsp7j/o99Vq4T5LCbQu9SoxxJURH/po4ld/NsNTEpHIlESpdoGRU4OR27kBc92g==
X-Received: by 2002:a05:6000:4383:b0:430:f182:788f with SMTP id ffacd0b85a97d-430f1827ae9mr8904843f8f.21.1765804167048;
        Mon, 15 Dec 2025 05:09:27 -0800 (PST)
Received: from google.com ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f6e78a7csm11582854f8f.34.2025.12.15.05.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 05:09:26 -0800 (PST)
Date: Mon, 15 Dec 2025 13:09:24 +0000
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Simon Glass <sjg@chromium.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] Input: cros_ec_keyb: add function key support
Message-ID: <aUAIhNMTPQVl3b4W@google.com>
References: <20251209154706.529784-1-fabiobaltieri@chromium.org>
 <20251209154706.529784-3-fabiobaltieri@chromium.org>
 <CAFLszThUU4hfb4vY4mmGHQadRKThG3e=9cAKRy_ampKwA_XNcA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFLszThUU4hfb4vY4mmGHQadRKThG3e=9cAKRy_ampKwA_XNcA@mail.gmail.com>

Hey Simon,

On Thu, Dec 11, 2025 at 06:29:01AM -0700, Simon Glass wrote:
> > @@ -44,6 +52,13 @@
> >   * @bs_idev: The input device for non-matrix buttons and switches (or NULL).
> >   * @notifier: interrupt event notifier for transport devices
> >   * @vdata: vivaldi function row data
> > + * @fn_key: coordinate of the function key
> > + * @fn_keymap: array of coordinate and codes for the function keys
> > + * @fn_keymap_len: number of entries in the fn_keymap array
> > + * @fn_key_status: active function keys bitmap
> > + * @normal_key_status: active normal keys bitmap
> > + * @fn_key_pressed: tracks the function key status
> > + * @fn_key_triggered: tracks where any function key fired
> >   */
> >  struct cros_ec_keyb {
> >         unsigned int rows;
> > @@ -61,6 +76,14 @@ struct cros_ec_keyb {
> >         struct notifier_block notifier;
> >
> >         struct vivaldi_data vdata;
> > +
> > +       uint32_t fn_key;
> 
> Normally we use u32/u8 these days

Okay, I did notice the file was a bit of a mix, I'll change them in v2.

> 
> > +       uint32_t *fn_keymap;
> > +       int fn_keymap_len;
> > +       uint32_t fn_key_status;
> > +       uint8_t normal_key_status[CROS_EC_KEYBOARD_COLS_MAX];
> > +       bool fn_key_pressed;
> > +       bool fn_key_triggered;
> >  };
> >
> >  /**
> > @@ -166,16 +189,108 @@ static bool cros_ec_keyb_has_ghosting(struct cros_ec_keyb *ckdev, uint8_t *buf)
> >         return false;
> >  }
> >
> > +static bool cros_ec_key_is(int row, int col, uint32_t key)
> > +{
> > +       if (row == KEY_ROW(key) && col == KEY_COL(key))
> > +               return true;
> > +
> > +       return false;
> > +}
> > +
> > +static void cros_ec_keyb_process_one(struct cros_ec_keyb *ckdev,
> > +                                    int row, int col, bool state)
> > +{
> > +       struct input_dev *idev = ckdev->idev;
> > +       const unsigned short *keycodes = idev->keycode;
> > +       int pos = MATRIX_SCAN_CODE(row, col, ckdev->row_shift);
> > +       unsigned int code = keycodes[pos];
> > +
> > +       dev_dbg(ckdev->dev, "changed: [r%d c%d]: byte %02x\n", row, col, state);
> > +
> > +       if (ckdev->fn_keymap) {
> > +               if (cros_ec_key_is(row, col, ckdev->fn_key)) {
> > +                       ckdev->fn_key_pressed = state;
> > +
> > +                       if (state) {
> > +                               ckdev->fn_key_triggered = false;
> > +                       } else if (!ckdev->fn_key_triggered) {
> > +                               /*
> > +                                * Send the original code if nothing else has
> > +                                * been pressed together with Fn.
> > +                                */
> > +                               input_event(idev, EV_MSC, MSC_SCAN, pos);
> > +                               input_report_key(idev, code, true);
> > +                               input_sync(ckdev->idev);
> 
> What is this function? I might be missing a patch?

input_sync? it sends an EV_SYN, been there from the start, though I
noticed I miss one two lines below, was relying on the rest of the
function to send it but I changed the logic at some point and broke that
path, will fix that.

> 
> > +
> > +                               input_event(idev, EV_MSC, MSC_SCAN, pos);
> > +                               input_report_key(idev, code, false);
> > +                       }
> > +
> > +                       return;
> > +               }
> > +
> > +               if (!state) {
> > +                       /* Key release, may need to release the Fn code */
> > +                       for (int i = 0; i < ckdev->fn_keymap_len; i++) {
> > +                               if (!cros_ec_key_is(row, col,
> > +                                                   ckdev->fn_keymap[i]))
> > +                                       continue;
> > +
> > +                               if ((ckdev->fn_key_status & BIT(i)) == 0)
> > +                                       continue;
> > +
> > +                               code = KEY_VAL(ckdev->fn_keymap[i]);
> > +                               ckdev->fn_key_status &= ~BIT(i);
> > +
> > +                               input_event(idev, EV_MSC, MSC_SCAN, pos);
> > +                               input_report_key(idev, code, state);
> > +
> > +                               return;
> > +                       }
> > +
> > +                       if ((ckdev->normal_key_status[col] & BIT(row)) == 0)
> > +                               /* Discard, key press code was not sent */
> > +                               return;
> > +               } else if (ckdev->fn_key_pressed) {
> > +                       /* Key press while holding Fn */
> > +                       ckdev->fn_key_triggered = true;
> > +
> > +                       for (int i = 0; i < ckdev->fn_keymap_len; i++) {
> > +                               if (!cros_ec_key_is(row, col,
> > +                                                   ckdev->fn_keymap[i]))
> > +                                       continue;
> > +
> > +                               code = KEY_VAL(ckdev->fn_keymap[i]);
> > +                               ckdev->fn_key_status |= BIT(i);
> > +
> > +                               input_event(idev, EV_MSC, MSC_SCAN, pos);
> > +                               input_report_key(idev, code, state);
> > +
> > +                               return;
> > +                       }
> > +
> > +                       /* Do not emit a code if the key is not mapped */
> > +                       return;
> > +               }
> > +       }
> 
> I think this function could do with splitting a bit

Yeah, I don't love it either but there's a lot of logic intertwined in
there, tried to split it myself and ended up breaking stuff, the logic
for the fn key itsel though can go that's a good 16 lines, I'll start
with that, send a v2 and then go from there.

> Can the sandbox driver support this too?

Not sure what you are referring to, can you give me a pointer?

Hey thanks for the review, good to hear from you. :-)

Cheers,
Fabio

-- 
Fabio Baltieri

