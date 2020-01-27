Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22A9A14ABE8
	for <lists+linux-input@lfdr.de>; Mon, 27 Jan 2020 23:07:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgA0WHl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Jan 2020 17:07:41 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46032 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbgA0WHl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Jan 2020 17:07:41 -0500
Received: by mail-pg1-f196.google.com with SMTP id b9so5840868pgk.12;
        Mon, 27 Jan 2020 14:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5RnacDdNt1j9C0tH28o+7IuLp5MiNQ8v6jYQ1H0H8Wg=;
        b=A+UKg4idIjIGGRab8Vjdakl3B5IBL8qFVpd9/0o+1tszgM46abx7KZWdIZp5GV17O9
         KnXtAgfmXhEDSSDOxi+5vcIZ+nWcftoJahBse+RKORy6MpGD1I4Ob9lm+w5KBkijOJg2
         DRlmpIsTJSTBwzEfULps/NhB2BZqI8b8mB6dYt0pTV1ZyGqpnfb89BeEKx1VXydSrn4s
         WkojNpcH9n5un08Gi7zOIIqD6oBmCk/vpZZznA6YmcAmsl/dMPrfLXMB2VyrsxQQwlAf
         iOCXKjNY18XTi/0KfjjqjCkWWg8LNMa0TjNUe34SfU5l9XeOcwikGcb4HK/uM0aHcPZw
         up4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5RnacDdNt1j9C0tH28o+7IuLp5MiNQ8v6jYQ1H0H8Wg=;
        b=E/aEM+xvCyYOQSfbEVe4zmQtPCDJCJXpctbsNNZvIsElmUy+jzE97OE6NpXLHuCRm1
         VPTztij7ZUJGAkOOSp7wYaZTTKtue75hDZ2fnK1eKna+8f4t6om1drCoRr6KpJcm9bWq
         YiGEMgzVz8gKqltTQEVWnamfYjozJKYXv4dulZWWTnEjNYBj2pI5ti86DZds4rbPgiWE
         JeSPzXqWOag4G3Dmt7IcQ7UYkqXAo1d9GHKRX3jhnjDkq05FIzlHRp5GQVyKHFJr3cai
         YZgN7SlBfm69aa9SZ25VvJe/WTCFGtZetsaUUuBzOgcYnC+jW5ncgA25w0xHh/s/uxFq
         TudQ==
X-Gm-Message-State: APjAAAWYk/wGvWK1Yt5Kw+6+EvoSa8mCQQxLJ6ebfqHUjJhct5OhygPV
        jd60UV5tgTFADTZD8O5Obpw=
X-Google-Smtp-Source: APXvYqzTq9gDcQDDx3LuPmugyD2tUjvpEgywZN0YYXTGKkgBw4QR7UfIOB24j3aBXLvZJA+d8/NZSg==
X-Received: by 2002:a63:ea4c:: with SMTP id l12mr20486565pgk.29.1580162860954;
        Mon, 27 Jan 2020 14:07:40 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id y6sm17451937pgc.10.2020.01.27.14.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2020 14:07:40 -0800 (PST)
Date:   Mon, 27 Jan 2020 14:07:38 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Benjamin Gaignard <benjamin.gaignard@st.com>, robh+dt@kernel.org,
        mark.rutland@arm.com, hadess@hadess.net,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yannick.fertre@st.com
Subject: Re: [PATCH v2 2/2] dt-bindings: touchscreen: Convert Goodix
 touchscreen to json-schema
Message-ID: <20200127220738.GF184237@dtor-ws>
References: <20200108091118.5130-1-benjamin.gaignard@st.com>
 <20200108091118.5130-3-benjamin.gaignard@st.com>
 <20200114233134.GA23810@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200114233134.GA23810@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jan 14, 2020 at 05:31:34PM -0600, Rob Herring wrote:
> On Wed, 8 Jan 2020 10:11:18 +0100, Benjamin Gaignard wrote:
> > Convert the Goodix binding to DT schema format using json-schema
> > 
> > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> > ---
> > version 2:
> > - enumerate goodix's I2C adresses
> > - add description for irq-gpio property
> > - reference the common properties used by goodix
> > 
> >  .../bindings/input/touchscreen/goodix.txt          | 50 --------------
> >  .../bindings/input/touchscreen/goodix.yaml         | 78 ++++++++++++++++++++++
> >  2 files changed, 78 insertions(+), 50 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/goodix.txt
> >  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> > 
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied, thank you.


-- 
Dmitry
