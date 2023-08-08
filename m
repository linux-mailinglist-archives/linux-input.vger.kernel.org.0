Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE429774E03
	for <lists+linux-input@lfdr.de>; Wed,  9 Aug 2023 00:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbjHHWJm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 8 Aug 2023 18:09:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjHHWJg (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 8 Aug 2023 18:09:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6124E51
        for <linux-input@vger.kernel.org>; Tue,  8 Aug 2023 15:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691532528;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Flz2QBTccsxoey25RxtTx/5hBDUCLeV9Z2hlojIPFFo=;
        b=Enn6Qbh2WJ12eb8ezUIYCJeFyNLYULGRip0EJ15dG92Wc2qKEgQB6BhwwWV1ojeTYUp0ev
        AAEqFCJhj9M0JScAL/SNdGStzQhBapwT/sougvZ/REL3Qz3PVUrkN3D+QTyR+80Nq+hTth
        Y/bhHd9JYeblpujAfJrbgB8hGiRDScw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-TE5F2hcLPAeXBL5NP_N2dA-1; Tue, 08 Aug 2023 18:08:47 -0400
X-MC-Unique: TE5F2hcLPAeXBL5NP_N2dA-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7683da3e2a5so674818885a.3
        for <linux-input@vger.kernel.org>; Tue, 08 Aug 2023 15:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691532527; x=1692137327;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Flz2QBTccsxoey25RxtTx/5hBDUCLeV9Z2hlojIPFFo=;
        b=ZvT8KMzoh6OqUPGqIWePOtYKwAaL8oJN/FKN1Lu9OFtzxL7vlS7oAEl0nEeO8d+WNH
         QleRWPEVBg7vwYjtlmrLs8UWxSXwLdQRTDCpyZNjHDGv9UR9nDPwHHu4zqIn3JzWGDUs
         BiV8CelVKKAAyEpYQLTczwpLKnmmkgvHdij11mSMAhRg9OhuH41/K5PfZA5BLROojoNE
         qQM+A4j91ppCP9/xLdmTL4lnr5oE9RgzjrVl74pH0V/tkTU//cz+oyGHMi3peR0+8kpm
         6gnRsaZK3oxI7cuQvFucPDtZq0ndBt8OQPiwWVxgN2RKj50n2u+AYKPookb0UcBGFFxd
         5ajA==
X-Gm-Message-State: AOJu0YwNaKzQtFAX/hWXtP/lunI/QQCH1vXualaATvxxsCnzc/uVqa5j
        irpwX2nJZ7sRbLKjrM6lMYXWKB0O/HTeRmv7Zf2uzH3ZYLruQD9wJryZFVtV5XipjzSjO+iZVx9
        Y53hHKEauXfDWFV1re/XKTl7ZrWn4kQ8=
X-Received: by 2002:a05:620a:2887:b0:765:874f:bd78 with SMTP id j7-20020a05620a288700b00765874fbd78mr1267639qkp.0.1691532527117;
        Tue, 08 Aug 2023 15:08:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEwD6r4Q/U9ptZw615hbG6h8Qqng+cLfnMRelRqVbSluN1hOYOG0F+SC/VQyf7P+6K/U677w==
X-Received: by 2002:a05:620a:2887:b0:765:874f:bd78 with SMTP id j7-20020a05620a288700b00765874fbd78mr1267623qkp.0.1691532526899;
        Tue, 08 Aug 2023 15:08:46 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c7d:5f00::feb? ([2600:4040:5c7d:5f00::feb])
        by smtp.gmail.com with ESMTPSA id b8-20020a05620a126800b0076c84240467sm3536896qkl.52.2023.08.08.15.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 15:08:46 -0700 (PDT)
Message-ID: <f9452c1fa9081ae44bb76eec48c6debd81ee0db7.camel@redhat.com>
Subject: Re: [PATCH] Revert "Input: synaptics - enable InterTouch for the
 ThinkPad P1 G3"
From:   Lyude Paul <lyude@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Sebastian Wick <sebastian.wick@redhat.com>,
        Aman Dhoot <amandhoot12@gmail.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Raul Rangel <rrangel@chromium.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andrew Duggan <aduggan@synaptics.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Tue, 08 Aug 2023 18:08:45 -0400
In-Reply-To: <ZNK8aG/y4ol7MXVp@google.com>
References: <20230808152817.304836-1-sebastian.wick@redhat.com>
         <f13f4ff7d46ecf887ca652b664860c4e07ec8b73.camel@redhat.com>
         <ZNK8aG/y4ol7MXVp@google.com>
Organization: Red Hat Inc.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 2023-08-08 at 15:06 -0700, Dmitry Torokhov wrote:
> On Tue, Aug 08, 2023 at 05:49:23PM -0400, Lyude Paul wrote:
> > Hm, This looks fine to me (if not as a final fix, certainly as a workar=
ound)
> >=20
> > Reviewed-by: Lyude Paul <lyude@redhat.com>
> >=20
> > However, this is definitely something we probably should try to fix at =
some
> > point - as I imagine this must be happening because something regarding=
 how
> > clicks are reported must have changed again. Andrew, do you have any id=
ea?
>=20
> I would like to understand more about this. Is this with newer/older
> BIOS, or another hardware revision of the product, or something else?


oops, somehow when typing that response I totally forgot I was responding t=
o a
revert ._., which changes everything

so yes - we should definitely look into this a bit more, I still have acces=
s
to this machine so I'll try to take a look tomorrow and see what's up
>=20
> Lyude, do you still have access to the unit you originally developed
> the original change for? Is the behavior broken there as well?
>=20
> Thanks.
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

