Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A8A5756D46
	for <lists+linux-input@lfdr.de>; Mon, 17 Jul 2023 21:32:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231544AbjGQTce (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Jul 2023 15:32:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231546AbjGQTcb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Jul 2023 15:32:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 985A81B6
        for <linux-input@vger.kernel.org>; Mon, 17 Jul 2023 12:32:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2BD8761231
        for <linux-input@vger.kernel.org>; Mon, 17 Jul 2023 19:32:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BFF2C433C9;
        Mon, 17 Jul 2023 19:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1689622348;
        bh=1kwi9TkpED6FARUR2+rcdmaANjuL8/Lt5mP0sTA5iow=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Sev0SP0ZCcZZpoGzapvk8P3KWeCggCVO9foujgOfRjnbT0dlNTIZEyX93q2QnwvqY
         g97OT1epFiE64Z9Ng189s/fJdHqgVc2ijd7mhuruvUjMSB/2WFpLN1NRM77xf//hEP
         oj8LsQG8HZW4p/KfLEl5z4gA0CDXz+rssNsZpq4c=
Date:   Mon, 17 Jul 2023 21:32:25 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jonathan Denose <jdenose@chromium.org>
Cc:     linux-input@vger.kernel.org
Subject: Re: Touchpad lost sync at byte 6
Message-ID: <2023071753-traverse-repayment-9e8d@gregkh>
References: <CALNJtpUN+DrWtudWdKZxYMR7oM-yt926fj7_Wi9dUPLZybw-vQ@mail.gmail.com>
 <2023062959-agreeable-zipfile-df6b@gregkh>
 <CALNJtpX_SanxbjHhEAikkPBGde812hPNW0z5fTiuPZRTpK-CLg@mail.gmail.com>
 <2023070838-vacation-ferris-e486@gregkh>
 <CALNJtpU8AnWDybNXxWfWwN2EbieJBJmQqsDMb_7hjG7c7OCOsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALNJtpU8AnWDybNXxWfWwN2EbieJBJmQqsDMb_7hjG7c7OCOsQ@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

On Mon, Jul 17, 2023 at 02:13:37PM -0500, Jonathan Denose wrote:
> Is linux-input@vger.kernel.org not also the input driver maintainers
> list? When I run get_maintainers.pl on the mouse driver files it gives
> me only this list and then some personal emails of some maintainers.

That would be correct.

> I think I may have forgotten to reply-all earlier in the thread so the
> list wasn't cc'd on all of the emails.

Then no one saw it :(

Please resend starting from the beginning.

thanks,

greg k-h
