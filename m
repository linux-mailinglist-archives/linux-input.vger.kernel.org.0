Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F1E8623486
	for <lists+linux-input@lfdr.de>; Wed,  9 Nov 2022 21:27:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230262AbiKIU1n (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Nov 2022 15:27:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231438AbiKIU1k (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 9 Nov 2022 15:27:40 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45F222FFE7;
        Wed,  9 Nov 2022 12:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1668025654; bh=8m5RsKJdIEPdudfyed0NiHYqG3qsnNLUXO6KWNM/qAU=;
        h=X-UI-Sender-Class:References:In-Reply-To:From:Date:Subject:To:Cc;
        b=jRe7WaYalxvUVPyAuEj6dwRkHKXLG+/CxnJFPaqdaIbFV0aEPHgyRr3HvSY3QI+BK
         DkQpgSk3nRTvB6+YShojfpOTBNtN4Nfzcj6HelxbszaqX1XYkc3E53/dyIxMuOS43Z
         y+/md+U+BgU2EwBIqlHsTrRu2h3AbppeAxoquWLkCDV2HoUKonLobKIPYhTyUQo8zS
         F4KmJD5MuqDHrYaXajcQR9lZxh5eWfplbOlpCrZGdB7bckNVARPCdJv2gkJzLI3HuM
         6ZwT2VFX4JB6AmV48VHK2wOE0stQEBnbcACkJ0SLUHt4CxJ/oqvjXBb4kIVA+q7V7d
         yLbUlPFdZby9g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mail-ej1-f41.google.com ([209.85.218.41]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MmlT2-1pIsoS24Aw-00jrp1; Wed, 09 Nov 2022 21:27:34 +0100
Received: by mail-ej1-f41.google.com with SMTP id kt23so49989604ejc.7;
        Wed, 09 Nov 2022 12:27:34 -0800 (PST)
X-Gm-Message-State: ACrzQf279XEuEDOsakijbTtlrnD1t88VhJt2G0PM0Fz224ORn7Br8TXv
        jRewWbR+Oc6Gq1aZkKheN0wK9z2qlFNIsffA6Po=
X-Google-Smtp-Source: AMsMyM5K2G73fwDYBXtKoyEWYPFXAG7bFDcRQ1d83+3PcpjBasB7dtNhYlmQGeyTP/LUZNPr1Yf/wlM+3VDPtrvYeS8=
X-Received: by 2002:a17:906:c414:b0:78d:a30f:3f46 with SMTP id
 u20-20020a170906c41400b0078da30f3f46mr1651184ejz.681.1668025654091; Wed, 09
 Nov 2022 12:27:34 -0800 (PST)
MIME-Version: 1.0
References: <Y1AVDck5sQf8+QFX@rowland.harvard.edu> <CABfF9mPU52OXTGcsbatJCG4nbP4zaPN3iJnttMg+xRyGY6dUEQ@mail.gmail.com>
 <CAO-hwJJ7cF-4kd8Mi6bb5n-k5LuMrWbpdMqFs82y7iQOscr-7g@mail.gmail.com>
 <CABfF9mNfU=swmpVXfVr7pYWs72jrd-HDY8+_NXyBDAKa4CWG5Q@mail.gmail.com>
 <CAO-hwJ+i3zd=CyU0T+Nb1vGfZfenMBH16ern_ncTTKEpyGAuBA@mail.gmail.com>
 <CABfF9mNrMx2BzU5tbBeapY15M4Ls_5xYBGfVB=Up5TJu=eWCcg@mail.gmail.com> <CAO-hwJJGAWkhZgGeLBruqCoskY5PBP-STs4kh-P6fBvpuSgpUw@mail.gmail.com>
In-Reply-To: <CAO-hwJJGAWkhZgGeLBruqCoskY5PBP-STs4kh-P6fBvpuSgpUw@mail.gmail.com>
From:   Andreas Bergmeier <abergmeier@gmx.net>
Date:   Wed, 9 Nov 2022 21:27:22 +0100
X-Gmail-Original-Message-ID: <CABfF9mO3SQZvkQGOC09H5s7EEd2UGhpE=GYB46g_zF3aEOVn=Q@mail.gmail.com>
Message-ID: <CABfF9mO3SQZvkQGOC09H5s7EEd2UGhpE=GYB46g_zF3aEOVn=Q@mail.gmail.com>
Subject: Re: Litra Glow on Linux
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        USB mailing list <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jiri Kosina <jikos@kernel.org>, linux-leds@vger.kernel.org,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:bmr9vzUtojE0WrHcji7T5BsjtxYjZeBJTNqHyDDK26Japq78VvL
 A/SKnbgF3fxifs1BVJt1V1HAV/N+SsnDUEw/ycOzLuVUziOdXctcI/I4+ImixcSTebyom5J
 2Y28BwT/PFASiLU5SREKYEM/7DDEPgjaEOkhz34hp4kSQEjReoir+SPD7Y+2lsCqG9Hyqqs
 KO+dfe8yzPIBK3mwRivJw==
UI-OutboundReport: notjunk:1;M01:P0:X0XLekWm4Yc=;6ixE16X9NxEZpr00w0VgMZ7GaC2
 ya/4Hb5h6nVNVMfheS/1GOWboLGgMqQT4M6UAG3tuNN2apMDVb4CNqxmMs1E49PHBOc4SL2XQ
 B1NdYMg89T7Jeqz+uTO+TOGocL5IUKovu61H7ZXf48L51lDe0wjtRTVHO3qOqffizx66xvJdf
 cUSGSVsBYH3s+ATBk10AAeoEuZUPL70+D0dQK+n8Qs7UjzGUEzt2wj1t9P0bg234r3NDJCv2U
 SWdwhBA8o9oYpOAgUFStyMW2rYS6Jh53NoMjKc9yr9b42y2yza8cwDfEwmKsD6gUSVqk0dyLa
 n9t3Sr3Yk+bkZeXl9ann4aoPAxr3iWs4rK7w6DbtfxwX+73WV9G9PyXpK/UassheTs0qLuztp
 v0cAcS8e6a9ChQi/d0ZXYzbc78xKJrgYqOSDvPaDmQBfX6Z89OqgiYE7HAWGKuHMr3KYah1qW
 UngjWY8Fooqm5mBqNd+lV2mckE4wjrJPQtDQnbsmTQ2zczicuiLsxUGyELEbFfsOvyyZdIgZf
 9Qa7820mJvemLrQdH/p5GbcO35ner42vg+bcyybpAsIKLMhYgF0JB1ZhNhsl/Ior1aIgtAmaA
 dxeYZDfwtYFQYA6JvBn1O7m9aP7rTUU4OpWQfEfm6Hq5KMrvJOWcJwL/ShvAHkR6Y521IKOs3
 Lpd4RLgZz9N3+rSE12zeJFqZj/HQUCgbA+vwr8ogGmf8pr1v6haNWyTYOrZlxWKcH8TNFM6xA
 7Umm2pIcr+o7XLPQ9J2ZPY0TjJYI6VUFWpTy54SmX05aV679DvMQr05FKtkIraQqihGMNhrUR
 c1Uuy/V0CWL8KOjhNHJbzCA3F8/R6dgfQDW70t1QH+fghQrlS1DpTmDBoVipBVkhNJyJqvHtN
 TBd8wfSDlh+KRaiGNxm1FDtq2WjS+6wUy+Uco1Q9/+C5eFfquCUKsVH8PfqDFgOEbk13ZEmJS
 yY6j0A==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Finally I have an environment where I can test my kernel code.

On Mon, 31 Oct 2022 at 10:29, Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
> For identifying the GLOW device you should be adding an id in the
> table of hid-logitech-hidpp, with a driver data that tells the driver
> to look for 0x1990.
>
> >
> > > - you need to add a hook in connect_event to register the led class
> > > device that will hook on to the actual LED of the device
Sadly my tests did not go very far. The code fails already when
calling the `probe` callback (`hidpp_probe`).
When it calls into `hidpp_root_get_protocol_version` it seems to
receive `HIDPP_ERROR_RESOURCE_ERROR`.
Which then leads to an error message: Device not connected
Upon looking at `HIDPP_ERROR_RESOURCE_ERROR` (9) there is no
documentation what it means in code.
From a look into the docs it says that 9 is UNSUPPORTED error for 2.0
devices. Thus I am wondering how the code knows
that it is a problem with connectivity. Couldn't it also mean that the
device is not supporting getting the protocol version?
And why is protocol version only enforced for non unifying devices?
