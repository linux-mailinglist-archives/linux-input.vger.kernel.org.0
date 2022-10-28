Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AFB7611753
	for <lists+linux-input@lfdr.de>; Fri, 28 Oct 2022 18:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230493AbiJ1QQ3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 Oct 2022 12:16:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230487AbiJ1QPy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 Oct 2022 12:15:54 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE1BA43AFB;
        Fri, 28 Oct 2022 09:14:59 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id b5so5237489pgb.6;
        Fri, 28 Oct 2022 09:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TD5l30vG1rtUw0AaFjv0iTM9qtrwO/l/Nk+Ie5csbe8=;
        b=EUrKK9bg8T1QLJ5Zj2yVqYDVvcip00wqonolJcThqUmT0naR9aUR55CTJT6UVJGnXv
         sfoYiBTyU1uj5d7tCXKkW8UMgk5vlTw/hIPVOI862wb5bn6xwYDXKThiFtgUmYqzGS5+
         5RzAqYlt8QS2DfOkDKr/Aq0onMabCuaC7tgbw5osXjs/dF8zcYQI69lNDWGqIBE41XW6
         4m3WRvbmCaLx6wfG6psP2IXOqlTq1vhT2yBhOVFKZhVQhTQo5aQXLEf5Zp94AD0Ir7HR
         mEd6BYEEX++Bu9gLItJL9fCqzTK3jn56gViic6zKaBbkhxpBcyq+oDlrLPhT/Yz+oRyz
         mRgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TD5l30vG1rtUw0AaFjv0iTM9qtrwO/l/Nk+Ie5csbe8=;
        b=s16RtHA3jIUIyjY0Xe5cSJRZMp33ZJwG9ae83DmQe5PVEQlToXi21dvZS2yWwRNVjl
         cSB1x53YXZ0/h7fskklDKxloZM1ILzi6Bc4a11Rgrx4GV956qEEMHPwX/GVFwujIRm7y
         Eq2ZgWSzVQI+F445FvwLTMQP18Vb2iHDQzXQRJBUDMxSHHnlO8sr1I4L4AeEkho6A2Bk
         OrOshdfmrIHqSxIa9EI3vcoNzLKErJMvkZosKCaxh/YrJWQj8fXut3KGbDBe7woQpp3V
         sdeoTow0Fb0b3dBCkFgtyCYdjio2rICJUcpEePULLpws6Qjda5LHKfUDpOWitLs2j84y
         Ed1g==
X-Gm-Message-State: ACrzQf06Ep2ylU6jaN+SAzyvB/gThWuw3V3CdKiXcxz5HytHCZ1rpo77
        NmtfimGKqgeEGpg/KlrPtzg=
X-Google-Smtp-Source: AMsMyM44iW1ux3scVaTcg0/Px0zZdci6OAaImQc97HaK4C2wibO4X0F0WOyLMkejM3ZmP5JVZdFmKA==
X-Received: by 2002:a05:6a00:b82:b0:56c:d5bf:1019 with SMTP id g2-20020a056a000b8200b0056cd5bf1019mr3934873pfj.72.1666973698850;
        Fri, 28 Oct 2022 09:14:58 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:ea9a:801b:ed52:2db1])
        by smtp.gmail.com with ESMTPSA id y27-20020a63181b000000b0041cd5ddde6fsm2863268pgl.76.2022.10.28.09.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 09:14:57 -0700 (PDT)
Date:   Fri, 28 Oct 2022 09:14:54 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/7] Additional fixes for Azoteq IQS7222A/B/C
Message-ID: <Y1v//k6MfHUd46F7@google.com>
References: <Y1SQ2t6yUvdaIQPG@nixie71>
 <87pmectm8a.fsf@baylibre.com>
 <Y1vYM0Fe323qZupM@nixie71>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="xnmABysITro+lN+6"
Content-Disposition: inline
In-Reply-To: <Y1vYM0Fe323qZupM@nixie71>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLY,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--xnmABysITro+lN+6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 28, 2022 at 08:25:07AM -0500, Jeff LaBundy wrote:
> Hi Mattijs,
> 
> Thank you for reaching out and helping to review this series.
> 
> On Fri, Oct 28, 2022 at 09:56:37AM +0200, Mattijs Korpershoek wrote:
> > On sam., oct. 22, 2022 at 19:54, Jeff LaBundy <jeff@labundy.com> wrote:
> > 
> > > This series comprises a second round of fixes that result from
> > > continued testing and updated guidance from the vendor.
> > >
> > > Jeff LaBundy (7):
> > >   Input: iqs7222 - drop unused device node references
> > >   dt-bindings: input: iqs7222: Reduce 'linux,code' to optional
> > >   Input: iqs7222 - report malformed properties
> > >   dt-bindings: input: iqs7222: Correct minimum slider size
> > >   Input: iqs7222 - protect against undefined slider size
> > >   dt-bindings: input: iqs7222: Add support for IQS7222A v1.13+
> > >   Input: iqs7222 - add support for IQS7222A v1.13+
> > >
> > >  .../bindings/input/azoteq,iqs7222.yaml        |  25 +-
> > >  drivers/input/misc/iqs7222.c                  | 504 +++++++++++-------
> > >  2 files changed, 311 insertions(+), 218 deletions(-)
> > 
> > Not sure this requires a re-send, but the series seems ill-formatted.
> > all patches are posted separately to the list instead of replying to the
> > cover letter. Is that expected?
> 
> Yes, this was a goof on my part. I see that the series is threaded
> properly on Patchwork but not on lore.kernel.org.
> 
> Much to my dismay, my mail service recently began enforcing OAuth2
> but declined to enable app-specific passwords as Gmail and others
> do. I can therefore no longer use git send-email directly and I am

You can teach git to work with OAuth - I am using Gmail without
application specific passwords. You simply need to use the credential
helper that would give the token instead of a password.

I have the following in my .gitconfig:

[credential]
	helper = cache --timeout=3000
	helper = local-helper

and I am using the attached script that gets client ID and refresh token
from the disk and generates authentication token. The script is using
Google OAUTH library and endpoint, but since you taught mutt how to work
with your provider you should be able to adjust it as needed.

And please do not judge me for this script ;)

> instead emulating it with a script that tunnels patches through mutt.
> 
> In this last series, my script inadvertenly dropped the '< >' from
> the cover letter's message ID, so some mailers may see this series
> as seven separate threads. This is fixed now.
> 
> That being said, I see this series was already applied earlier this
> week; I think a mail simply did not go out. So no further action is
> needed.

Sorry, my bad, I forgot to send the notice.

Thanks.

-- 
Dmitry

--xnmABysITro+lN+6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=git-credential-local-helper

#!/usr/bin/env python3

import argparse
import gnupg
import os
import sys
from google.oauth2.credentials import Credentials as Oauth2Creds
from google.auth.transport.requests import Request as AuthRequest

def eprint(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)

class SMTPCredential(object):
    CONFIG_DICT = {
        'dtor@chromium.org' : ('Chromium', False),
        'dtor@google.com' : ('Google', False),
        'dmitry.torokhov@gmail.com' : ('Gmail', True),
        'dtor@kernel.org' : ('Kernel.org', False),
    }

    def __init__(self):
        self.gpg = gnupg.GPG(gpgbinary="gpg2", use_agent=True)
        self.data_path = os.path.expanduser('~/.mutt/passwords/')

    def get_unencrypted_data(self, config_name):
        file_name = os.path.join(self.data_path, config_name)
        with open(file_name, 'r') as fp:
            lines = fp.read().splitlines()
            return next(iter(lines), None)

    def get_encrypted_data(self, config_name):
        file_name = os.path.join(self.data_path, config_name)
        with open(file_name, 'rb') as fp:
            crypt = self.gpg.decrypt_file(fp)
            if crypt.ok:
                lines = crypt.data.splitlines()
                return next(iter(lines), None)

    def get_password(self, config_name):
        return self.get_encrypted_data(config_name)

    def get_oauth2_creds(self, config_name):
        client_id = self.get_unencrypted_data(config_name + ".oauth.client")
        client_secret = self.get_encrypted_data(config_name + ".oauth.secret")
        refresh_token = self.get_encrypted_data(config_name + ".oauth.refresh")
        if client_id and client_secret and refresh_token:
            return Oauth2Creds(None,
                               refresh_token=refresh_token,
                               token_uri='https://oauth2.googleapis.com/token',
                               client_id=client_id,
                               client_secret=client_secret)

    def get_oauth2_token(self, config_name):
        creds = self.get_oauth2_creds(config_name)
        if creds:
            creds.refresh(AuthRequest())
            return creds.token

    def get(self, username, **kwargs):
        (name, oauth2) = self.CONFIG_DICT[username]
        secret = self.get_oauth2_token(name) if oauth2 \
                 else self.get_password(name)
        if secret:
            print("password={0}".format(secret))

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('operation', action="store", type=str,
            help="Git action to be performed (get|store|erase)")
    # parse all arguments
    arguments = parser.parse_args()

    myvars = {}
    for line in sys.stdin:
        name, val = line.partition("=")[::2]
        myvars[name.strip()] = val.strip()

    if arguments.operation == "get":
        try:
            protocol = myvars.pop('protocol')
            username = myvars.pop('username')
            cred_class = globals()[protocol.upper() + "Credential"]
            cred = cred_class()
            cred.get(username, **myvars)
        except:
            eprint("Failed to get credential")
            raise
    elif arguments.operation == "store":
        pass
    elif arguments.operation == "erase":
        pass
    else:
        eprint("Invalid git operation")

if __name__ == "__main__":
    main()

--xnmABysITro+lN+6--
