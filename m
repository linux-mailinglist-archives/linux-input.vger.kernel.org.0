Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8B5B24846F
	for <lists+linux-input@lfdr.de>; Tue, 18 Aug 2020 14:07:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbgHRMHE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Aug 2020 08:07:04 -0400
Received: from freki.datenkhaos.de ([81.7.17.101]:43902 "EHLO
        freki.datenkhaos.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726357AbgHRMHD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Aug 2020 08:07:03 -0400
X-Greylist: delayed 465 seconds by postgrey-1.27 at vger.kernel.org; Tue, 18 Aug 2020 08:07:01 EDT
Received: from localhost (localhost [127.0.0.1])
        by freki.datenkhaos.de (Postfix) with ESMTP id B900F30EB543;
        Tue, 18 Aug 2020 13:59:14 +0200 (CEST)
Received: from freki.datenkhaos.de ([127.0.0.1])
        by localhost (freki.datenkhaos.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id TVKJud7BAoif; Tue, 18 Aug 2020 13:59:12 +0200 (CEST)
Received: from latitude (geri.datenkhaos.de [81.7.17.45])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by freki.datenkhaos.de (Postfix) with ESMTPSA;
        Tue, 18 Aug 2020 13:59:12 +0200 (CEST)
Date:   Tue, 18 Aug 2020 13:59:06 +0200
From:   Johannes Hirte <johannes.hirte@datenkhaos.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        groeck@chromium.org, Nicolas Boichat <drinkcat@chromium.org>,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] HID: usbhid: do not sleep when opening device
Message-ID: <20200818115906.GA26874@latitude>
References: <20200610043824.GA171503@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200610043824.GA171503@dtor-ws>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 2020 Jun 09, Dmitry Torokhov wrote:
> usbhid tries to give the device 50 milliseconds to drain its queues when
> opening the device, but dies it naively by simply sleeping in open handler,
> which slows down device probing (and thus may affect overall boot time).
> 
> However we do not need to sleep as we can instead mark a point of time in
> the future when we should start processing the events.
> 
> Reported-by: Nicolas Boichat <drinkcat@chromium.org>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
> 

This change breaks various Logitech devices: 
https://bugzilla.kernel.org/show_bug.cgi?id=208935

-- 
Regards,
  Johannes Hirte

