Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E23DB5BDFD0
	for <lists+linux-input@lfdr.de>; Tue, 20 Sep 2022 10:21:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230171AbiITIVF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Sep 2022 04:21:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231175AbiITIUN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Sep 2022 04:20:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA046B7D6
        for <linux-input@vger.kernel.org>; Tue, 20 Sep 2022 01:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663661913;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=nYBXnM221OKkMmYnX56agU4HA29O1+0qE07dmbgFr1Y=;
        b=EBJn5WbTCik2ruEHQHWdCoIQrba7H6PjRvrCWuqRJzWrOcxfEuIB8RATBraQyS5CYVCjcO
        FlSFe5lFWTZEu4hiQvTqI/+rFGiJ/LCqz8wjiewSVK3TWfo2jD64ViXZnMgm4htawTpO5v
        OV0uzkUPGARmcHlKK+Z6GyteBkbslyE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-210-doefiJZ9Px6yTYjqUDa80Q-1; Tue, 20 Sep 2022 04:18:31 -0400
X-MC-Unique: doefiJZ9Px6yTYjqUDa80Q-1
Received: by mail-wm1-f71.google.com with SMTP id i132-20020a1c3b8a000000b003b339a8556eso814597wma.4
        for <linux-input@vger.kernel.org>; Tue, 20 Sep 2022 01:18:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=nYBXnM221OKkMmYnX56agU4HA29O1+0qE07dmbgFr1Y=;
        b=fJ7GoIbDPNIceaxGMxA+sDfgvqqfoiqWeZ1D9L5ke3xpqfhtsK/ZVfLd1f49kKLmFS
         Yb8bDSS4FTfePvN3ulxu+CPobx6kTLmcPePylMB8WIiT5HACv+AzVlzCh7sOszBy36yb
         /l2apct8NMWa7oWweMZGpk1YfcMBcBnSGs4MspSqtniKsA2xH6HFGJTIoaRhu7GUnEEE
         kxhD47cLtpbXM2oDtMha/kLqBg0UWR9tt/alhtCfC5XvMyEarpqsGkyOzIKg/cJiKWEA
         uYwcCPFNVzwfoggx2XHEvcwS1Dr9zLHO5zyQDA6O5pEjVrmDr20u0/x+WeX3SGFoGg/Z
         dxlw==
X-Gm-Message-State: ACrzQf0JaGNAodnkjda+SmOtmquwRomZXo6Tp73fbYRygBfHj/6JsHrr
        AdbqdZt4Z2QjGRYCG/SnLFg16g4fZEbHvHQHQbuqYm93UK4v2dL2gPPNU4a7uuUXNwAbe0apQLA
        ZFeX8ad9V0ktWwSxn5JjecNc=
X-Received: by 2002:a5d:4ec5:0:b0:228:6707:8472 with SMTP id s5-20020a5d4ec5000000b0022867078472mr13700969wrv.12.1663661910616;
        Tue, 20 Sep 2022 01:18:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Gc746EtqOMp12PC/ZhI3qlffavJ9O8HKgnaDgO6702xNdn3VPX99CEZYZBDDZBLY3QzW+vw==
X-Received: by 2002:a5d:4ec5:0:b0:228:6707:8472 with SMTP id s5-20020a5d4ec5000000b0022867078472mr13700953wrv.12.1663661910369;
        Tue, 20 Sep 2022 01:18:30 -0700 (PDT)
Received: from sgarzare-redhat (host-87-11-6-69.retail.telecomitalia.it. [87.11.6.69])
        by smtp.gmail.com with ESMTPSA id z22-20020a05600c0a1600b003b4868eb6bbsm1749112wmp.23.2022.09.20.01.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 01:18:29 -0700 (PDT)
Date:   Tue, 20 Sep 2022 10:18:24 +0200
From:   Stefano Garzarella <sgarzare@redhat.com>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     vdasa@vmware.com, vbhakta@vmware.com, namit@vmware.com,
        bryantan@vmware.com, zackr@vmware.com,
        linux-graphics-maintainer@vmware.com, doshir@vmware.com,
        gregkh@linuxfoundation.org, davem@davemloft.net,
        pv-drivers@vmware.com, joe@perches.com, netdev@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH 0/3] MAINTAINERS: Update entries for some VMware drivers
Message-ID: <20220920081824.vshwiv3lt5crlxdj@sgarzare-redhat>
References: <20220906172722.19862-1-vdasa@vmware.com>
 <20220919104147.1373eac1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220919104147.1373eac1@kernel.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Sep 19, 2022 at 10:41:47AM -0700, Jakub Kicinski wrote:
>On Tue,  6 Sep 2022 10:27:19 -0700 vdasa@vmware.com wrote:
>> From: Vishnu Dasa <vdasa@vmware.com>
>>
>> This series updates a few existing maintainer entries for VMware
>> supported drivers and adds a new entry for vsock vmci transport
>> driver.
>
>Just to be sure - who are you expecting to take these in?
>

FYI Greg already queued this series in his char-misc-next branch:
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git/log/?h=char-misc-next

Thanks,
Stefano

