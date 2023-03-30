Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6B76CFE2B
	for <lists+linux-input@lfdr.de>; Thu, 30 Mar 2023 10:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbjC3IXx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 30 Mar 2023 04:23:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjC3IXw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 30 Mar 2023 04:23:52 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 205051727;
        Thu, 30 Mar 2023 01:23:51 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id D283A1FEA0;
        Thu, 30 Mar 2023 08:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1680164629; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ByFAfmSPj10Mw78BaMXnotsF0EThOT5754/yOyFKQ14=;
        b=TRuWDQxuOtOQf2MjYQRPWN+/AyHBP9vc6v6qg0nNVg8UCNh9VKVm29GKIj/LetibQNVQHT
        1gEsQSe8ch93GG3PHYgmeZwWsKtlHp7rFgtgbr+4RxKtL46HWfwJw8eX7mpE6CGr7EAzQJ
        HL5Uaf6cYNuC6LwEmx94gM1Ner6h8Bo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1680164629;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ByFAfmSPj10Mw78BaMXnotsF0EThOT5754/yOyFKQ14=;
        b=rYT4c19Xle6TWzOhfpqe8oUBHnFgzg4mcgBQCuydnWg0c1Pk82UFyeVox4TOs3bGUFyQl/
        kka8YZ/+Z2zB7UCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AFF88138FF;
        Thu, 30 Mar 2023 08:23:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id hKtYKhVHJWR5FQAAMHmgww
        (envelope-from <tiwai@suse.de>); Thu, 30 Mar 2023 08:23:49 +0000
Date:   Thu, 30 Mar 2023 10:23:49 +0200
Message-ID: <87mt3umyui.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Pali =?ISO-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        regressions@lists.linux.dev, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] wrong coord from Thinkpad TrackPoint since 6.2 kernel
In-Reply-To: <874jq3q52i.wl-tiwai@suse.de>
References: <87h6u4otuc.wl-tiwai@suse.de>
        <3dec29bf-b772-d82d-fff9-6c8bcca5f464@redhat.com>
        <874jq3q52i.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 29 Mar 2023 11:28:53 +0200,
Takashi Iwai wrote:
> 
> On Wed, 29 Mar 2023 11:22:18 +0200,
> Hans de Goede wrote:
> > 
> > Hi Takashi,
> > 
> > On 3/29/23 10:16, Takashi Iwai wrote:
> > > Hi,
> > > 
> > > we've received a bug report about Thinkpad TrackPoint (ALPS DualPoint
> > > Stick) on 6.2 kernel:
> > >   https://bugzilla.opensuse.org/show_bug.cgi?id=1209805
> > > 
> > > The device reports the wrong values as the movements, e.g. sometimes a
> > > value such as 255, 254 or -255 is returned while usually it should be
> > > a smaller value like -1 or 2.
> > > 
> > > The evtest on 6.2.x kernel shows the wrong values like:
> > > 
> > > Event: time 1680037542.898747, type 2 (EV_REL), code 0 (REL_X), value 255
> > > Event: time 1680037542.898747, -------------- SYN_REPORT ------------
> > > Event: time 1680037543.145196, type 2 (EV_REL), code 0 (REL_X), value 1
> > > Event: time 1680037543.145196, -------------- SYN_REPORT ------------
> > > Event: time 1680037543.175087, type 2 (EV_REL), code 1 (REL_Y), value -255
> > > Event: time 1680037543.175087, -------------- SYN_REPORT ------------
> > > Event: time 1680037543.185421, type 2 (EV_REL), code 0 (REL_X), value 1
> > > Event: time 1680037543.185421, type 2 (EV_REL), code 1 (REL_Y), value -255
> > > Event: time 1680037543.185421, -------------- SYN_REPORT ------------
> > > 
> > > while 6.1.x kernel shows the correct values like:
> > > 
> > > Event: time 1680037386.318058, type 2 (EV_REL), code 0 (REL_X), value -1
> > > Event: time 1680037386.318058, type 2 (EV_REL), code 1 (REL_Y), value -1
> > > Event: time 1680037386.318058, -------------- SYN_REPORT ------------
> > > Event: time 1680037386.328087, type 2 (EV_REL), code 0 (REL_X), value -1
> > > Event: time 1680037386.328087, type 2 (EV_REL), code 1 (REL_Y), value -1
> > > Event: time 1680037386.328087, -------------- SYN_REPORT ------------
> > > Event: time 1680037386.338046, type 2 (EV_REL), code 0 (REL_X), value -1
> > > Event: time 1680037386.338046, type 2 (EV_REL), code 1 (REL_Y), value -2
> > > Event: time 1680037386.338046, -------------- SYN_REPORT ------------
> > >   
> > > I couldn't see any relevant changes in alps.c between those versions,
> > > so this is likely a breakage in a lower layer.
> > > 
> > > Could you guys take a look?
> > 
> > I believe this is caused by the kernel now using -funsigned-char
> > everywhere and this should be fixed by this commit:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/commit/?h=for-linus&id=754ff5060daf5a1cf4474eff9b4edeb6c17ef7ab
> 
> Ah, that makes sense!
> 
> I'll build a test kernel with this fix and ask the reporter for
> testing.

And it's confirmed that the commit above fixes the problem indeed.


thanks,

Takashi
