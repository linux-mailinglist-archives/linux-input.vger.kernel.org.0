Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAED54C8934
	for <lists+linux-input@lfdr.de>; Tue,  1 Mar 2022 11:24:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234201AbiCAKZW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Mar 2022 05:25:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232720AbiCAKZV (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Mar 2022 05:25:21 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3E3145A082
        for <linux-input@vger.kernel.org>; Tue,  1 Mar 2022 02:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646130280;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=icGaIlb+8xRI7+dmr4JSyVwA8wzjwmZczIuDpdfhj24=;
        b=LqBTqVovr7wSl3rgDy8zFr9NLnbCvEu3O9cOlAu6VQh01SrBY8N6De1GtNekAN8mQUwI1D
        Hn7TVxGVbWBIWICJ1EGQsbbiQyxI/jsE2werwWQF6G8UhrfXQdfFl7V2AL2Y34qsiM36g0
        /P95rVKI0N4L4mS+f39I+rWQkExXjOI=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-yVZcrxMPPgiS2mUAxhIHqA-1; Tue, 01 Mar 2022 05:24:39 -0500
X-MC-Unique: yVZcrxMPPgiS2mUAxhIHqA-1
Received: by mail-pl1-f199.google.com with SMTP id s19-20020a170902b19300b00149a463ad43so6076083plr.1
        for <linux-input@vger.kernel.org>; Tue, 01 Mar 2022 02:24:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=icGaIlb+8xRI7+dmr4JSyVwA8wzjwmZczIuDpdfhj24=;
        b=l/3NVI+NhQGtmgAnXxPkVkjDmhNaM+NCt9n13a8GlQcwy7agxycUcPLOLQtxuRIoDI
         5rsw5kpKiWdl63BAXk7IL/xYhtstvTPrHQxWvxJ9rYOgTxdapaTYnngSCJh+X6BV9sCz
         NovlGtt+5tdYTJ51T2jLugWdxZl6Ss49LVX5LvBi+PkdM8XvRqXTBlguYasrkbwI4pLo
         dUPxGKpye+KCnP7TxSVx+7+Hj934xPLdMN0ZGIeNfILzhpN0AGfX7ISL5z86gDlsaoeH
         KDFpkrDEidBQHt+tTAnkLQM7vbxZxI5ShSsovQLewS7F5fijEet/OENGYATDQBAUJAH9
         GWqw==
X-Gm-Message-State: AOAM530hKHaFJd0YlI/lOGmXoHXcvnOUtVpUgrMYDmI3EpDU9wI+7a3X
        KS9b5JMRXPzeBxZnt4tZ/6Ql/8UCVMB1lq5cEv8U+OQ59MWNd4NIHZ9zahPtBUD6tsIpobZvY/D
        Lr7pqVFxVRfrl8EVWLz0RZctNDQgxyBx3ZIIZYy0=
X-Received: by 2002:a65:5bc3:0:b0:378:4f82:d73d with SMTP id o3-20020a655bc3000000b003784f82d73dmr15717648pgr.191.1646130277868;
        Tue, 01 Mar 2022 02:24:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxBQsIzRcU8ZHxCXfE8y1ML/zok0jUYHQCFX5tgRVr5yjctcqImzG/Wyd51vqugL8mEnndNuhhUmVxdS9uKRF8=
X-Received: by 2002:a65:5bc3:0:b0:378:4f82:d73d with SMTP id
 o3-20020a655bc3000000b003784f82d73dmr15717629pgr.191.1646130277636; Tue, 01
 Mar 2022 02:24:37 -0800 (PST)
MIME-Version: 1.0
References: <20220218233350.1.I3a7746ad05d270161a18334ae06e3b6db1a1d339@changeid>
 <Yh3LMzmru8cngoGT@google.com>
In-Reply-To: <Yh3LMzmru8cngoGT@google.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 1 Mar 2022 11:24:26 +0100
Message-ID: <CAO-hwJL2DVqqjW7JBypTCvs_YdMvpNFUXMaHrYsrQK0uonDAXQ@mail.gmail.com>
Subject: Re: [PATCH v2] HID: Add mapping for KEY_ALL_APPLICATIONS
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     William Mahon <wmahon@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        William Mahon <wmahon@google.com>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 1, 2022 at 8:28 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Fri, Feb 18, 2022 at 11:35:49PM +0000, William Mahon wrote:
> > This patch adds a new key definition for KEY_ALL_APPLICATIONS
> > which is an alias of KEY_DASHBOARD.
> >
> > It also maps the 0x0c/0x2a2 usage code to KEY_ALL_APPLICATIONS.
>
> Jiri, Benjamin, OK for me to pick it up?

Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Cheers,
Benjamin

>
> >
> > Signed-off-by: William Mahon <wmahon@google.com>
> > ---
> >
> >  drivers/hid/hid-input.c                | 2 ++
> >  include/uapi/linux/input-event-codes.h | 1 +
> >  2 files changed, 3 insertions(+)
> >
> > diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> > index eccd89b5ea9f..c3e303c1d8d1 100644
> > --- a/drivers/hid/hid-input.c
> > +++ b/drivers/hid/hid-input.c
> > @@ -1162,6 +1162,8 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
> >
> >               case 0x29d: map_key_clear(KEY_KBD_LAYOUT_NEXT); break;
> >
> > +             case 0x2a2: map_key_clear(KEY_ALL_APPLICATIONS);        break;
> > +
> >               case 0x2c7: map_key_clear(KEY_KBDINPUTASSIST_PREV);             break;
> >               case 0x2c8: map_key_clear(KEY_KBDINPUTASSIST_NEXT);             break;
> >               case 0x2c9: map_key_clear(KEY_KBDINPUTASSIST_PREVGROUP);                break;
> > diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> > index 311a57f3e01a..e520f22c1b8d 100644
> > --- a/include/uapi/linux/input-event-codes.h
> > +++ b/include/uapi/linux/input-event-codes.h
> > @@ -279,6 +279,7 @@
> >  #define KEY_PROG3            202
> >  #define KEY_PROG4            203
> >  #define KEY_DASHBOARD                204     /* AL Dashboard */
> > +#define KEY_ALL_APPLICATIONS KEY_DASHBOARD
> >  #define KEY_SUSPEND          205
> >  #define KEY_CLOSE            206     /* AC Close */
> >  #define KEY_PLAY             207
> > --
> > 2.35.1.473.g83b2b277ed-goog
> >
>
> --
> Dmitry
>

