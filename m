Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9267A66DAA1
	for <lists+linux-input@lfdr.de>; Tue, 17 Jan 2023 11:10:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236029AbjAQKKf convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Tue, 17 Jan 2023 05:10:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236115AbjAQKKf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Jan 2023 05:10:35 -0500
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B4E12D177
        for <linux-input@vger.kernel.org>; Tue, 17 Jan 2023 02:10:32 -0800 (PST)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id C64E0100005;
        Tue, 17 Jan 2023 10:10:30 +0000 (UTC)
Message-ID: <9b6ac5d94f62b2d51ab730f6d2158aca44daeba2.camel@hadess.net>
Subject: Re: [PATCH 1/2] HID: hid-steam: Add Steam Deck support
From:   Bastien Nocera <hadess@hadess.net>
To:     Vicki Pfau <vi@endrift.com>
Cc:     linux-input@vger.kernel.org
Date:   Tue, 17 Jan 2023 11:10:29 +0100
In-Reply-To: <a438b9b6-6646-deb9-e369-c22d5b8dc570@endrift.com>
References: <20230111012336.2915827-1-vi@endrift.com>
         <b39a98e08de09e0ddeb26b69a55297684813bc2f.camel@hadess.net>
         <a438b9b6-6646-deb9-e369-c22d5b8dc570@endrift.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 2023-01-16 at 21:22 -0800, Vicki Pfau wrote:
> 
> 
> On 1/11/23 02:24, Bastien Nocera wrote:
> > On Tue, 2023-01-10 at 17:23 -0800, Vicki Pfau wrote:
> > > Add preliminary support for the Steam Deck's controller
> > > interface.
> > > Currently,
> > > this only supports the controller inputs and toggling lizard
> > > mode. It
> > > does not
> > > support any of the advanced features, such as the motion sensors
> > > or
> > > force-feedback.
> > 
> > I had to look up what "lizard mode" is. This is a pretty awful name
> > for
> > a "compatibility"/"boot" mode. This should probably be defined in
> > the
> > commit message as that's a Valve specific term.
> > 
> 
> It's already defined in the comment at the top of the file.

This doesn't appear in the patch itself though.

>  Does it need to be defined again in the commit message? If so, does
> every vendor-specific term used in every driver need to be defined
> every commit mentions that functionality? That seems wasteful, if so.

That's how I would do it, or change the name so it's not eyerollingly
cumbersome (and scientifically inaccurate ;)

But I'll let the maintainers comment on this.

Please make sure to keep the mailing-list on CC:.
