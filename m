Return-Path: <linux-input+bounces-5674-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B24A956F37
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 17:49:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3708B22B1C
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 15:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BA7812B176;
	Mon, 19 Aug 2024 15:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eqG64uGi"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AA63BBF2;
	Mon, 19 Aug 2024 15:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724082555; cv=none; b=oAJB37RqevmAqLfXqoQNIWDE/qnTpQECjYOSNs6vh+VOm5MUseYUYwLgazlFMAFDdQlLVtisccOsgh3XgHxjh6dUEieXtPsm7xx8bav6CPNHDp7nGDJXeahhmG5v8MWmiZQeBiODsyptQvgHw7YuJT1AIzpbko91ORsRsfUuyk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724082555; c=relaxed/simple;
	bh=fyyjBZF2oTWVnLLBDD6Q09Azx4KL9wSZUi8MT6p9g/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sNiCZ4HzgdIdLSzXN2Vku/W494gXFM1b8OnLk/wqM4qwqHESIrzBphr8w0qMCyHOayvvEYxzXFDLV4EeCDCbUwVDPPcnzMY1MFU8A7nGGGvBPWIbJXxQZcTRSCqFJARgRe4jA0tkGAp28iAKCJ+NJjl/ztq9JxXPN3lD4HwnMjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eqG64uGi; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-201cd78c6a3so34406635ad.1;
        Mon, 19 Aug 2024 08:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724082554; x=1724687354; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CSLcyqFQ3EMWy37KrwIoFJyqnZnAuoV7z3EUYygVqD8=;
        b=eqG64uGi+Syv1Qv2ylK0M4z+MpoVlQxkCnApP4Vo7wyTPphFweZW2P5NLiK3W5VFbF
         0qsBmVzlxqwmYpq3SHi4L1sUQ3ZjDhlB2cH9aJ+v8FBqReK+NUCPrlsc6Fzu0aU9zFln
         u0H23YQuFo4Immxpu6NqKNVffq2b19A4ar/JG6n0s1w43+Ig7tt3I+AXZk+IIz7t8Zvj
         6g22moYnk/CiM+O00oLVXsJ3WlnHj58SN94LJ+aepaUTbkMt3DuJZ10rbKkFYJuaJNah
         zsoz6FO99FAxRkL0zgvrFR03gwjWywe8WQtrdg8HX1gl+aNDhxbnDnscMr/YS7/8qbid
         3rNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724082554; x=1724687354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSLcyqFQ3EMWy37KrwIoFJyqnZnAuoV7z3EUYygVqD8=;
        b=rE/u16rwBYYBkBOaKMI8DR3M73ey8J4TazULCm39+0zhjvk0GPxuAA5IhITZatROmA
         VlGuPXzp/lDOHO6t+K6fbRXjNuR000n6M+KCYk7RXANDvsN2+B8SH7hGBO4ntZrEoFCK
         YXwGN9BoPmXls3sTkXbLGiNPE/hlwVEBPW/kl+MTiAXJhv8p7oi2+XAX05QFUBtmU0NV
         8wyjE9kiRN145IZ/WITYvDpqUng3S+HgxcjJUHQ9SOPboqihlNAzELtCLP+oYLapAsoz
         /iopQY/RhbyynjKbndy1Eh48cSwJQDZhv8NxtRDA9bVyORncZq2OX+mHxDgRSu2vDXY4
         YMDA==
X-Forwarded-Encrypted: i=1; AJvYcCVoquPA/aaKiGobzWt6zZowy23S7cEm7rawvuuHf6hsPoJ/NgpcG94inrsCyNLw4bx8K0CGOqoPBqWPoPTAI8Gr2eeAyvTaWFs1iicZSEzk2juQ0mr0gMKmuKL0LvKFSZSvNELz24lgNh+GJH4VI4/EuNlI3pyE48QjffFyARVQGlbJTWdmKmmT/kLry2wnveywPLEDPW+XtQ3hwTehus3FgpCrZvizRsk=
X-Gm-Message-State: AOJu0YzrBKURwMWqzH5Y1tXKlw72gM8ubSuRTLNgR3KZC5FlclueWMgQ
	TxMOnY1HjIq07dyQxnq1m5Pd6XDqavh1gs+MtLuafIy59eLqswpSNBv7Lg==
X-Google-Smtp-Source: AGHT+IEU9Es4Ml341v7O0mbmgFiXC/PhOCgXS75ZkA/SB7UZuypVK5RcoYwAPwcMAnMi1qk6M4kD+w==
X-Received: by 2002:a17:903:228a:b0:1fd:a942:1558 with SMTP id d9443c01a7336-20203f329a2mr180311055ad.40.1724082553437;
        Mon, 19 Aug 2024 08:49:13 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f80c:1483:bced:7f88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f038b401sm63783585ad.213.2024.08.19.08.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 08:49:13 -0700 (PDT)
Date: Mon, 19 Aug 2024 08:49:10 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 09/14] dt-bindings: input: samsung,s3c6410-keypad:
 introduce compact binding
Message-ID: <ZsNpdhKlLYegkosN@google.com>
References: <20240819045813.2154642-1-dmitry.torokhov@gmail.com>
 <20240819045813.2154642-10-dmitry.torokhov@gmail.com>
 <dbs44pwxfhsnmdzsd32mp7rlhq6w5fanu5bakuisxmyz2ehbtd@cdfr26oicjll>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dbs44pwxfhsnmdzsd32mp7rlhq6w5fanu5bakuisxmyz2ehbtd@cdfr26oicjll>

On Mon, Aug 19, 2024 at 03:02:07PM +0200, Krzysztof Kozlowski wrote:
> On Sun, Aug 18, 2024 at 09:58:06PM -0700, Dmitry Torokhov wrote:
> > The binding with a sub-node per each key is very verbose and is hard to
> > use with static device properties. Allow standard matrix keymap binding
> > in addition to the verbose one.
> > 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  .../input/samsung,s3c6410-keypad.yaml         | 57 ++++++++++++++++++-
> >  1 file changed, 54 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/input/samsung,s3c6410-keypad.yaml b/Documentation/devicetree/bindings/input/samsung,s3c6410-keypad.yaml
> > index a53569aa0ee7..28a318a0ff7e 100644
> > --- a/Documentation/devicetree/bindings/input/samsung,s3c6410-keypad.yaml
> > +++ b/Documentation/devicetree/bindings/input/samsung,s3c6410-keypad.yaml
> > @@ -16,6 +16,10 @@ description:
> >  maintainers:
> >    - Krzysztof Kozlowski <krzk@kernel.org>
> >  
> > +allOf:
> > +  - $ref: input.yaml#
> > +  - $ref: matrix-keymap.yaml#
> > +
> >  properties:
> >    compatible:
> >      enum:
> > @@ -37,6 +41,10 @@ properties:
> >  
> >    wakeup-source: true
> >  
> > +  keypad,num-columns: true
> > +  keypad,num-rows: true
> > +  linux,keymap: true
> > +
> >    linux,input-no-autorepeat:
> >      type: boolean
> >      description:
> > @@ -81,12 +89,33 @@ patternProperties:
> >        - keypad,row
> >        - linux,code
> >  
> > +dependencies:
> > +  linux,keymap:
> > +    required:
> 
> Why "required" keyword? The dependencies should have just list of
> properties. See example-schema.

OK, changed this to

dependencies:
  linux,keymap: [ "keypad,num-columns", "keypad,num-rows" ]
  
> 
> > +      - keypad,num-columns
> > +      - keypad,num-rows
> > +
> >  required:
> >    - compatible
> >    - reg
> >    - interrupts
> > -  - samsung,keypad-num-columns
> > -  - samsung,keypad-num-rows
> > +
> > +if:
> 
> put allOf: here and this within allOf, so you the "if" could grow in the
> future.

Hmm, there is already "allOf" at the beginning of the file, so adding
another one results in complaints about duplicate "allOf". I can move it
all to the top, like this:

allOf:
  - $ref: input.yaml#
  - $ref: matrix-keymap.yaml#
  - if:
      required:
        - linux,keymap
    then:
      properties:
        samsung,keypad-num-columns: false
        samsung,keypad-num-rows: false
      patternProperties:
        '^key-[0-9a-z]+$': false
    else:
      properties:
        keypad,num-columns: false
        keypad,num-rows: false
      required:
        - samsung,keypad-num-columns
        - samsung,keypad-num-rows

Is this OK? I don't quite like that "tweaks" are listed before main
body of properties.

Thanks.

-- 
Dmitry

