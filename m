Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AE65651F34
	for <lists+linux-input@lfdr.de>; Tue, 20 Dec 2022 11:48:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233358AbiLTKsC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Dec 2022 05:48:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233364AbiLTKsA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Dec 2022 05:48:00 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35FB3DD0
        for <linux-input@vger.kernel.org>; Tue, 20 Dec 2022 02:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671533245;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=BtcNXhVAF5Mh5/Biw8m1gljXz/koZEnrJ8YAHCfLSVg=;
        b=Z1TZBCI3zN9PU4yrFqRqXxPmBSMvy7+/p/iyD1RGTQ/pN4JiNk8Mxn4JsN6SmobIhhDxdO
        kvzbPEke9izlKV3qEsUnSPhyxPSSY6kxkx52PIGM3OVss+lL8RfwNC0IY2hVQCiIzk1thQ
        +3HRK9izcHmPh2cUDv6Wm+sTBGmhEUY=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-214-65LJ2e5SOBiYwIbLD0vl5w-1; Tue, 20 Dec 2022 05:47:24 -0500
X-MC-Unique: 65LJ2e5SOBiYwIbLD0vl5w-1
Received: by mail-il1-f199.google.com with SMTP id j3-20020a056e02154300b00304bc968ef1so8079610ilu.4
        for <linux-input@vger.kernel.org>; Tue, 20 Dec 2022 02:47:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BtcNXhVAF5Mh5/Biw8m1gljXz/koZEnrJ8YAHCfLSVg=;
        b=jLH0dm+NO35/NtqEA6O/qhCxGcFYNK5MepxoJAY2h87PBll9qY3hvVSy4fV4Q7OdGt
         b9wh4BEMTy0tF6GKvE6J1TrO0BR/BNhxFkOqII1IyTGFGfAMxa27w/pj3uQrYh23/dtD
         0wbCEY+iiC59zAz8yCCL4C3UlG2P0uHgABdQ70lgAlNNGzBboPc9VlJn8sSckSzj63zD
         vNwF38rVBldb8cCi8MNMImMKZIssPzsgfLlr3It55cPVjAtY5SfVS6lpHyTXzi4J3cW/
         RUcLu/cyIf7QWP39Yv6fgDmB0ySwpjT5bXMBIkK73zIm9YOfiyIC3Xh45pqwdY9IMjVU
         X2wg==
X-Gm-Message-State: ANoB5pnxSo/kiurFEmXwXlSd19209XCl59EAK4LBLpkzoaCoc5NWzk7/
        ziVi+CwW6UJkKW/wT30I6SGb+ULtmSjkuPlwCM7yL+O/poJ+9YkQc19uttNdbH4I0k5FVPHJ1J5
        Z7yUkw4ytBySYuBQIbIxtVc/spnaloUWlAdcwyUA=
X-Received: by 2002:a02:a089:0:b0:375:2a78:73fd with SMTP id g9-20020a02a089000000b003752a7873fdmr46525969jah.217.1671533242987;
        Tue, 20 Dec 2022 02:47:22 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7JBXJpg6qNm9SgzBNzQZEfnJaZx37hGB0TWVUAAFj/Mc2O387CUR2IQywQyTtLbStHSDLWatI/4QD3XC8tKTg=
X-Received: by 2002:a02:a089:0:b0:375:2a78:73fd with SMTP id
 g9-20020a02a089000000b003752a7873fdmr46525962jah.217.1671533242764; Tue, 20
 Dec 2022 02:47:22 -0800 (PST)
MIME-Version: 1.0
References: <20221220024921.21992-1-jiasheng@iscas.ac.cn> <035598f0-3174-9677-0b53-f3ccbfb54155@amd.com>
In-Reply-To: <035598f0-3174-9677-0b53-f3ccbfb54155@amd.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 20 Dec 2022 11:47:11 +0100
Message-ID: <CAO-hwJ++Dr94062SPnbqRJ33yJ5qB48--rnGyNQ12d6VvsCRUA@mail.gmail.com>
Subject: Re: [PATCH] HID: amd_sfh: Add missing check for dma_alloc_coherent
To:     Basavaraj Natikar <bnatikar@amd.com>
Cc:     Jiasheng Jiang <jiasheng@iscas.ac.cn>, basavaraj.natikar@amd.com,
        jikos@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Dec 20, 2022 at 7:53 AM Basavaraj Natikar <bnatikar@amd.com> wrote:
>
>
> On 12/20/2022 8:19 AM, Jiasheng Jiang wrote:
> > Add check for the return value of the dma_alloc_coherent since
> > it may return NULL pointer if allocation fails.
> >
> > Fixes: 4b2c53d93a4b ("SFH:Transport Driver to add support of AMD Sensor Fusion Hub (SFH)")
> > Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> > ---
> >  drivers/hid/amd-sfh-hid/amd_sfh_client.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
> > index 8275bba63611..ab125f79408f 100644
> > --- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
> > +++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
> > @@ -237,6 +237,10 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
> >               in_data->sensor_virt_addr[i] = dma_alloc_coherent(dev, sizeof(int) * 8,
> >                                                                 &cl_data->sensor_dma_addr[i],
> >                                                                 GFP_KERNEL);
> > +             if (!in_data->sensor_virt_addr[i]) {
> > +                     rc = -ENOMEM;
> > +                     goto cleanup;
> > +             }
> >               cl_data->sensor_sts[i] = SENSOR_DISABLED;
> >               cl_data->sensor_requested_cnt[i] = 0;
> >               cl_data->cur_hid_dev = i;
>
> looks good to me.
>
> Acked-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

Thanks.

I have now applied this patch to hid.git branch for-6.2/upstream-fixes.

Cheers,
Benjamin

