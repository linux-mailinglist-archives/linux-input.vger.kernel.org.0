Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FBA7650D06
	for <lists+linux-input@lfdr.de>; Mon, 19 Dec 2022 15:07:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231447AbiLSOH5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Dec 2022 09:07:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbiLSOHz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Dec 2022 09:07:55 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CDE9E0B0
        for <linux-input@vger.kernel.org>; Mon, 19 Dec 2022 06:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671458836;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=KEJDZNDYG8jgkUFiyxMtZsIwVDRp1nGXHFp3JCGo77Q=;
        b=ZARQtK9R3zmh5oa2TrxG7yASbebieXrMzWAGMosPH/2WIcupP9TZYE4UFA+OSjjDlrWqH4
        lFv8VHEVx3GA7ESIucwrU+EnsOyiO0SiX0TPUAlgZwFmTpqBCUAWolDNx17uO595j3JyxB
        uQJJsBdyxVWARbmaFf4Rl40df1CtcEU=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-21-yyC9yF2YNdOR1A26oVj0Dw-1; Mon, 19 Dec 2022 09:07:06 -0500
X-MC-Unique: yyC9yF2YNdOR1A26oVj0Dw-1
Received: by mail-il1-f197.google.com with SMTP id l13-20020a056e0212ed00b00304c6338d79so6640966iln.21
        for <linux-input@vger.kernel.org>; Mon, 19 Dec 2022 06:07:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KEJDZNDYG8jgkUFiyxMtZsIwVDRp1nGXHFp3JCGo77Q=;
        b=jKV/IvFRDhqw33862FQD3RAqxI4kD7KFKCQJLkVxX+2bOLvZt3tXzffWsOO783pdFQ
         nZhTY7c+ktsPKkDuC76mWbU4mDGCkqdTJGK0QZBfY0DKQaCYZ3469F5pC181OipZAo55
         3A6u22mfYUcBe3cgsNWbBEFD0CN54oEYbgvVEsoF3KuIb/phr9DCNs1sEo4zXPKV77oR
         +cpcbsksneL2rBnkFBjgA7CLiFTSWf/sDCm4eWSd9MF+9ISFuNCOVRA1/vt+xYmgHgmg
         NTxTMdT6quuzzxPWj4EE439D3Ri3tKY1P8DbTU4NKgR5bz0fA1Zr/7OxVIjO+CHkdU+j
         elmQ==
X-Gm-Message-State: ANoB5pkZ98Pq7AzS3T6g6tgzwA/CFaeAdv9VtlCT0x1PTYkSNw2MdH/e
        5YIjjtyJMB0AI3TcVN/PBsoQKIdAV0ECBRRsBo73JOX9GtZ/Jd3qowH3qBYfeAB2PXwCWVice0u
        ngNyIX+POSx86id+dR7Eq/h2lXVKdgtuRiTecTng=
X-Received: by 2002:a05:6e02:12c2:b0:302:e38e:761b with SMTP id i2-20020a056e0212c200b00302e38e761bmr33339180ilm.61.1671458826242;
        Mon, 19 Dec 2022 06:07:06 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5YEOcd+KU8W0cmhYaEkNh2vB927hKh3z3K8RRZ4eUUJAHJOVjdxAiaA3/32QyzP2ebT30WBOD5SXW/VkPNfF0=
X-Received: by 2002:a05:6e02:12c2:b0:302:e38e:761b with SMTP id
 i2-20020a056e0212c200b00302e38e761bmr33339179ilm.61.1671458826011; Mon, 19
 Dec 2022 06:07:06 -0800 (PST)
MIME-Version: 1.0
References: <20221213044935.1775499-1-roderick.colenbrander@sony.com>
In-Reply-To: <20221213044935.1775499-1-roderick.colenbrander@sony.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 19 Dec 2022 15:06:55 +0100
Message-ID: <CAO-hwJJi7aR3AHMHLdiRrj-QGzU74CvKF4mrwbdgmx9JnJ5dMA@mail.gmail.com>
Subject: Re: [PATCH 0/1] HID: playstation: DS4 fixes
To:     Roderick Colenbrander <roderick@gaikai.com>
Cc:     Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Dec 13, 2022 at 5:49 AM Roderick Colenbrander
<roderick@gaikai.com> wrote:
>
> Hi,
>
> Apparently on some Android ARM platforms, the Bluetooth DS4
> path was crashing due to an undefined pointer value.
> For some reasons (compile flags, compiler, x86?) I didn't
> hit this issue yet. The patch fixes the issue.
>
> Thanks,
> Roderick Colenbrander
>
> Roderick Colenbrander (1):
>   HID: playstation: fix free of uninialized pointer for DS4 in
>     Bluetooth.

Thanks for the patch.

I have applied it to for-6.2/upstream-fixes

Cheers,
Benjamin

