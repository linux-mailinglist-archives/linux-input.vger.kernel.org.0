Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4563D84C8
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2019 02:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387836AbfJPAXt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Oct 2019 20:23:49 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38103 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728796AbfJPAXt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Oct 2019 20:23:49 -0400
Received: by mail-pg1-f194.google.com with SMTP id w3so6234374pgt.5;
        Tue, 15 Oct 2019 17:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=I5RlOLZySckKP5cYriAdiMDQeKyzUX7DMFPOaR5ZKuE=;
        b=T5LgUFtmPdOtpxG7Nf3TrYyVL0Cej8ZlA7L4q+G96miPkpdWWHEFPSPqGBLx2vktsz
         vAsxdxL8sVtL4lKJm60LDq8hHWieONqBqyuo/4RW8ndPTrWZa9nMEgejerNex8uTmeSv
         yjlerXf54P5kK6+vE1lp+jQE45vTRczJLsjcn3CDKryM9U6FWAL8T+J3EQ41YJA0kE7M
         LDV5oSCelpVuuHDx5byxx7B4k2SGq7X3GhFJQPcH91nsz4lpYjnT1i0ZMZecsSBnRGsa
         vj4H+fE7ea9/IUyj37kc+s0Tyix3erfhvUSADrYjaItJ0+BiFPMP+UKK9AM4XyBxacGK
         08Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=I5RlOLZySckKP5cYriAdiMDQeKyzUX7DMFPOaR5ZKuE=;
        b=TclUJPEk6A9cBqzHXPv5Vnx3Q5biH+fthxFdFZ2OdibjCQ6A8YvH99/oY22hBp+Jqz
         AibzhJUL1xEeWDZ7W7Oib/dgyWXBvqc1Pk2MzIePEVR1DRFFwznZkru/RVYCHAZfBh52
         4lidutZCZa3thuJy5nulflkXt1YJroK6ZpygGf+1fb6kfznJOrI6Hf29nClqqaUqyLYs
         171Grd8ofU2V8ArBv39JqTojYNGJIVKizCAY7t9GY7gFlI3q7BPVIScTRoOo0l/HBYAE
         NBBn8ghhbnlgdXoorAXfxcw+V1MAlqliNg5zrg0aPilB6XHmFfMRrqL3+IGbdO9uNupc
         vBig==
X-Gm-Message-State: APjAAAXCfKDJg9JahzyWcmLYk9BGz2et0G0IRVv0AGbKXR0fv7Hnnu0K
        qxQAiMK8zheCA3TtMbsETnU=
X-Google-Smtp-Source: APXvYqxVa5PJkMLej+htEzLuTNh4DjznMHIlmReyh8/rBwMbX+zHHqpX186lrFBYjb1WOJ+5OYX/Ug==
X-Received: by 2002:a17:90a:bb98:: with SMTP id v24mr1464068pjr.10.1571185428272;
        Tue, 15 Oct 2019 17:23:48 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id s5sm418835pjn.24.2019.10.15.17.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 17:23:47 -0700 (PDT)
Date:   Tue, 15 Oct 2019 17:23:45 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: input: Add common input binding in
 json-schema
Message-ID: <20191016002345.GK105649@dtor-ws>
References: <1570083176-8231-1-git-send-email-michal.vokac@ysoft.com>
 <1570083176-8231-2-git-send-email-michal.vokac@ysoft.com>
 <20191010193537.GA14324@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191010193537.GA14324@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Oct 10, 2019 at 02:35:37PM -0500, Rob Herring wrote:
> On Thu,  3 Oct 2019 08:12:52 +0200, =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= wrote:
> > Create schema for the common input properties and merge all properties
> > from the Documentation/devicetree/bindings/input/keys.txt binding into
> > this common schema.
> > 
> > Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
> > ---
> > Changes since v2:
> >  - Merge content of keys.txt binding inti this schema.
> > 
> > Changes since v1:
> >  - New patch in the series.
> > 
> >  Documentation/devicetree/bindings/input/input.yaml | 32 ++++++++++++++++++++++
> >  Documentation/devicetree/bindings/input/keys.txt   |  8 ------
> >  .../devicetree/bindings/input/mtk-pmic-keys.txt    |  4 +--
> >  .../devicetree/bindings/input/st,stpmic1-onkey.txt |  2 +-
> >  4 files changed, 35 insertions(+), 11 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/input/input.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/input/keys.txt
> > 
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied, thank you.

-- 
Dmitry
