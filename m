Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECF055E6884
	for <lists+linux-input@lfdr.de>; Thu, 22 Sep 2022 18:35:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbiIVQfJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Sep 2022 12:35:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbiIVQfE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Sep 2022 12:35:04 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1B7B6BD67
        for <linux-input@vger.kernel.org>; Thu, 22 Sep 2022 09:35:01 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id bj12so22201240ejb.13
        for <linux-input@vger.kernel.org>; Thu, 22 Sep 2022 09:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=80Ysi9BOZsUySgtl5w14oQyBL/DjQ2nqgskjrFp2JKY=;
        b=Rf0lLgIXWgX+pNVKvIfdMFHSwK8n4MRrg8lOYn4mYs0RStvSNUJolq7PD9kx6Ye+Vh
         no06ijhZ9UM00OyLJ6ER2BeaANafwHEHMY6xQsvbsSdhyhy2Cy57SB/cxL+hxvfJDZJs
         dV/zhPHh6AH9bFZu5TPA+YupsESJPwFFoTdlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=80Ysi9BOZsUySgtl5w14oQyBL/DjQ2nqgskjrFp2JKY=;
        b=NblltcY1HINeQ/3Sk25EzpmQrycl5OfTbQDwQsTmwH4tMgy9wlR42U9zMlYTOT6UMf
         /FR8gBFndBTcH/2kp8BDovUwP7BtuJjyhTCIWamnag+Ef1U0pcOmvBS7BT+l/mO88bjA
         waiGwZBU4+a/NGtO/NChaX9anfm+HHdWHxg36PrQduJ5a44CO3v4Qt+WPnM5IzN5fFyY
         iXhra8sE21LOsv3pSblmeRhJO+CLeJBIYCLzKVGPzJ48vjmijyFJB71nY/QuDp3fRFGv
         A1jMO3ExykAFFj3hdi2S+AeMXhVUlzJYqa9qDgVPu5NEnzVwh85GuNi8bEBl69Oc1GX/
         TL7w==
X-Gm-Message-State: ACrzQf1iKq5o+BStrYU/p08ZAFrxTU1qzyfOKs+Cz/wf/TWzuBW0kP6n
        3fGfAjMn1C5tLae2y955yYIquF6d5W50ACDs
X-Google-Smtp-Source: AMsMyM5Q1pPGeIhmGT3XkZfsAEfx+vUu5pUCLRa0rwl4iCzX+xm65bKo7PjIhKACMSSgSTuNN+2OGA==
X-Received: by 2002:a17:907:b1b:b0:781:320f:b76c with SMTP id h27-20020a1709070b1b00b00781320fb76cmr3510665ejl.671.1663864498995;
        Thu, 22 Sep 2022 09:34:58 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id f10-20020a170906084a00b0073c80d008d5sm2776644ejd.122.2022.09.22.09.34.57
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 09:34:57 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id t4so3221428wmj.5
        for <linux-input@vger.kernel.org>; Thu, 22 Sep 2022 09:34:57 -0700 (PDT)
X-Received: by 2002:a05:600c:1e18:b0:3b3:b9f8:2186 with SMTP id
 ay24-20020a05600c1e1800b003b3b9f82186mr3148288wmb.151.1663864496688; Thu, 22
 Sep 2022 09:34:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220922101813.v4.1.I3aa360986c0e7377ea5e96c116f014ff1ab8c968@changeid>
 <20220922101813.v4.3.Ic4e8f03868f88b8027a81bc3d414bae68978e6b7@changeid>
In-Reply-To: <20220922101813.v4.3.Ic4e8f03868f88b8027a81bc3d414bae68978e6b7@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 22 Sep 2022 09:34:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WvagXMojeQJW-uzy59Q0m0oQpjopNwPkupDq4gGJoQgw@mail.gmail.com>
Message-ID: <CAD=FV=WvagXMojeQJW-uzy59Q0m0oQpjopNwPkupDq4gGJoQgw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] dt-bindings: input: touchscreen: elants_i2c: Add
 eth3915n touchscreen chip
To:     Yunlong Jia <ecs.beijing2022@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Yunlong Jia <yunlong.jia@ecs.com.tw>,
        Henry Sun <henrysun@google.com>,
        Bob Moragues <moragues@chromium.org>,
        David Heidelberg <david@ixit.cz>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Thu, Sep 22, 2022 at 3:23 AM Yunlong Jia <ecs.beijing2022@gmail.com> wrote:
>
> Add an elan touch screen chip eth3915n.
>
> Signed-off-by: Yunlong Jia <ecs.beijing2022@gmail.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

You should have left my Reviewed-by off in this case. I haven't
actually seen this patch. You could have possibly added "Suggested-by"
or just left me off entirely until I gave you the tag.


> ---
>
> (no changes since v1)

I probably would have added this in patman:

Series-changes: 4
-  eth3915n dt bindings added in v4.

Without that you get the "(no changes from v1)" which is always weird
since this patch is new for v4.


>  .../devicetree/bindings/input/touchscreen/elan,elants_i2c.yaml   | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/elan,elants_i2c.yaml b/Documentation/devicetree/bindings/input/touchscreen/elan,elants_i2c.yaml
> index a9b53c2e6f0ab..d28625372f5ac 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/elan,elants_i2c.yaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/elan,elants_i2c.yaml
> @@ -17,6 +17,7 @@ properties:
>      enum:
>        - elan,ektf3624
>        - elan,ekth3500
> +      - elan,ekth3915

This is not quite right because for elan,ekth3915 you're expecting
device trees to have:

compatible = "elan,ekth3915", "elan,ekth3500"

In other words it's actually a 3915 but the 3500 driver should work
fine. I believe a reasonable syntax is:

  compatible:
    oneOf:
      - enum:
          - elan,ektf3624
          - elan,ekth3500
      - items:
          - const: elan,ekth3915
          - const: elan,ekth3500

-Doug
