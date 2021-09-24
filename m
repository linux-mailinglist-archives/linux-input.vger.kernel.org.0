Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95AA44179EC
	for <lists+linux-input@lfdr.de>; Fri, 24 Sep 2021 19:37:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344455AbhIXRic (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 Sep 2021 13:38:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241912AbhIXRi2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 Sep 2021 13:38:28 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 268DDC061571
        for <linux-input@vger.kernel.org>; Fri, 24 Sep 2021 10:36:55 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id j13so10163701qtq.6
        for <linux-input@vger.kernel.org>; Fri, 24 Sep 2021 10:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bn+EOcsGiuHlMMNs2pRVtdHzmHV4Ku1gPjyNslBYDb8=;
        b=IFXqSHwuYAAszeO0Grn3MHEdvuy4n+GZLmIp2AW5IRwy1o66bIQE8CxnYACsoAllzW
         bvph12pRpiGwbf8sJZajTZ7JSam7cytebpWjYngFxhsgKX27UNj++xS7Zl0uPPDOYeY/
         8+VISu54HBT+4IY/6agS0Gnibg6ISZsbsIU6xgxm7l6/recFo1DOAyjYBXqC42UQcOwt
         Bw2HJCB1P5WJUu4nOUJivrPXxBhgoGzFKTDCLN3NAJ0Fqj+pQxr7WyqB+SmgMTC0cNN5
         MOVqwpZ/3f+6QvVYa0rrJ97JG63ksrCN8IKhjzC/RVBCPatTHpuH9eVDv/QPKmce9C+i
         6puw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bn+EOcsGiuHlMMNs2pRVtdHzmHV4Ku1gPjyNslBYDb8=;
        b=QGa59ggPGZpX6qQi181136/wQS8t8RdWz9OIYhYIgmQcyjIz6YRwXj0IuAsKte+h6S
         0SWO5WoT8D+VGr9afONX1uFpf4FF7Y/bZ+6p+LHmVQUm9u4BKQDNfjyHRqtjwxIjAEBK
         j+IuJX1tvkNeCP6szm+6Hup113T3AYq36IKCLn8zDFNtm7Bk/0onoQAsyHd6s93oKKsr
         qKQmopnLsXrGn7Y9wENpXUb73QD3tDx8MdBwshSmTVuzzRLIeXCCYQMgrnyp1NAYmS2E
         1uuLWi+lSZndTNAiQVroigZoMzdsHCFDzKwGwvcvP9yQ6F23vnydJWl5gQNlqyyqNmhe
         /ZFw==
X-Gm-Message-State: AOAM532ILrJ+GUxU7oQRJGVg9f9193eecfwZ0USF88Dgunfvd/B8Q2QL
        ygAZYD5vYq3OEEna9Bav6og=
X-Google-Smtp-Source: ABdhPJyuvmA+Ola1c6fi2aeOfuafdXBwWItKxP56L8a/3g+JTp2FhulaFMp1TScXr1NjuZP2ZgZscw==
X-Received: by 2002:a05:622a:130c:: with SMTP id v12mr5359913qtk.315.1632505014072;
        Fri, 24 Sep 2021 10:36:54 -0700 (PDT)
Received: from localhost.localdomain (cpe-68-175-35-150.nyc.res.rr.com. [68.175.35.150])
        by smtp.gmail.com with ESMTPSA id x10sm917982qtq.45.2021.09.24.10.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 10:36:53 -0700 (PDT)
From:   Jim Posen <jim.posen@gmail.com>
To:     gupt21@gmail.com
Cc:     benjamin.tissoires@redhat.com, jikos@kernel.org,
        linus.walleij@linaro.org, linux-input@vger.kernel.org,
        tobias.junghans@inhub.de
Subject: Re: [PATCH 2/2] HID: mcp2221: configure GP pins for GPIO function
Date:   Fri, 24 Sep 2021 13:36:21 -0400
Message-Id: <20210924173620.888507-1-jim.posen@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CALUj-gvpwhYW8FuTaEjSmgNUhMTizYKvXDxAu6c6SNPbHNdOyg@mail.gmail.com>
References: <CALUj-gvpwhYW8FuTaEjSmgNUhMTizYKvXDxAu6c6SNPbHNdOyg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Thanks for submitting this patch Tobias, I ran into the same issue using the GPIO pins on the MCP2221.

I don't have prior experience with Linux driver dev, but I'm going to add some thoughts anyway.

The approach of configuring the pins for GPIO operation on request/free makes sense to me as opposed to assuming they were already configured somehow beforehand. Aside from being inconvenient, assuming correct configuration seems like a recipe for accidentally shorting the pin, which Rishi is concerned about.

With regards to your patch, I find it odd that the handler for the MCP2221_SRAM_SETTINGS_GET event sets gp_default_settings. Instead, I suggest it set gp_runtime_settings then memcpys from gp_runtime_settings to gp_default_settings at the bottom of probe. And rename mcp_get_gp_default_settings to mcp_get_gp_settings.

I ran into another bug in this driver which I think makes sense to fix in this patch set: direction and value are flipped in the mcp_get_gpio struct. According to the data sheet, value comes before direction for each pin.

With this patch and that last bug fixed, I have tested the driver and GPIO operations are now working for me.
